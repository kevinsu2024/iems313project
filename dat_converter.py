


def set_init(f, max_num):
    for i in range(1, max_num+1):
        f.write(" " + str(i))
    f.write(";\n")

def convert(cases):

    # Parsing Data
    # cases = ["case14_ieee", "case118_ieee", "case588_sdet", "case4661_sdet", "case13659_pegase"]
    for case in cases:
        bra_file = open("phase1_cases/"+case+"_branch_data.csv", 'r')
        gen_file = open("phase1_cases/"+case+"_generator_data.csv", 'r')
        dem_file = open("phase1_cases/"+case+"_demand_data.csv", 'r')

        lines = []
        # skip first line (headers)
        next(bra_file)
        # [from_bus, to_bus, line_id, reactance, lower_line_limit, upper_line_limit]
        # parse it to [from_bus, to_bus, line_id, bus_susceptance, upper_line_limit]
        max_bus = 1
        max_line_id = 1

        bus_set = set()
        raw_lines = bra_file.readlines()
        # for line in raw_lines:
        #     parsed_line = line.strip().split(',')
        #     from_bus, to_bus, line_id, reactance, lower_line_limit, upper_line_limit = parsed_line
        #     bus_set.add((from_bus, to_bus, line_id))

        for line in raw_lines:
            parsed_line = line.strip().split(',')
            from_bus, to_bus, line_id, reactance, lower_line_limit, upper_line_limit = parsed_line
            bus_susceptance = str(int((1/float(reactance))*(10**5)))
            upper_line_limit = str(int(float(upper_line_limit)*(10**5)))
            
            max_bus = max(max_bus, int(from_bus), int(to_bus))
            max_line_id = max(max_line_id, int(line_id))
            if ((from_bus, to_bus, line_id)) in bus_set:
                line_id = "-" + line_id
            lines.append([from_bus, to_bus, line_id, bus_susceptance, upper_line_limit])
            # if (to_bus, from_bus, line_id) not in bus_set:
            lines.append([to_bus, from_bus, line_id, bus_susceptance, upper_line_limit])
            
            bus_set.add((from_bus, to_bus, line_id))
            bus_set.add((to_bus, from_bus, line_id))

        demands = []
        # skip first line (headers)
        next(dem_file)
        # [bus, demand]
        zero_demand_buses = {str(i) for i in range(1,max_bus+1)}
        for line in dem_file.readlines():
            bus, demand = line.strip().split(',')
            zero_demand_buses.remove(bus)
            demand = str(int(float(demand)*(10**5)))
            demands.append([bus, demand])
        for bus in zero_demand_buses:
            demands.append([bus, "0"])

        generators = []
        # skip first line (headers)
        next(gen_file)
        # [bus, id, min_gen, max_gen, lin_cost_coeff]
        max_gen_id = 1
        for line in gen_file.readlines():
            parsed_line = line.strip().split(',')
            bus, gen_id, min_gen, max_gen, lin_cost_coeff = parsed_line
            min_gen = str(int(float(min_gen)*(10**5)))
            max_gen = str(int(float(max_gen)*(10**5)))
            lin_cost_coeff = str(int(float(lin_cost_coeff)*(10**5)))
            max_gen_id = max(max_gen_id, int(gen_id))
            generators.append([bus, gen_id, min_gen, max_gen, lin_cost_coeff])

        max_line_id_per_tuple = {}
        for line in lines:
            from_bus, to_bus, line_id, bus_susceptance, upper_line_limit = line
            if (from_bus, to_bus) not in max_line_id_per_tuple:
                max_line_id_per_tuple[(from_bus, to_bus)] = int(line_id)
            else:
                max_line_id_per_tuple[(from_bus, to_bus)] = max(max_line_id_per_tuple[(from_bus, to_bus)], int(line_id))
        for i, line in enumerate(lines):
            from_bus, to_bus, line_id, bus_susceptance, upper_line_limit = line
            if ("-" in line_id):
                line_id = str(max_line_id_per_tuple[(from_bus, to_bus)] + 1)
                max_line_id_per_tuple[(from_bus, to_bus)] += 1
                lines[i] = [from_bus, to_bus, line_id, bus_susceptance, upper_line_limit]
        # Writing dat file
            
        f = open(case+".dat", "w")
        f.write("set BUSES :=")
        set_init(f, max_bus)
        f.write("set LINE_IDS :=")
        set_init(f, max_line_id)
        f.write("set GENERATOR_IDS :=")
        set_init(f, max_gen_id)
        f.write("set LINES := ")
        for from_bus, to_bus, line_id, bus_susceptance, upper_line_limit in lines[:-1]:
            f.write("("+from_bus+","+to_bus+","+line_id+"), ")
        f.write("("+lines[-1][0]+","+lines[-1][1]+","+lines[-1][2]+");\n")
        f.write("set GENERATORS := ")
        for bus, gen_id, min_gen, max_gen, lin_cost_coeff in generators[:-1]:
            f.write("("+bus+","+gen_id+"), ")
        f.write("("+generators[-1][0]+","+generators[-1][1]+");\n\n")

        f.write("param : bus_susceptance\tupper_line_limit\t:=")
        for from_bus, to_bus, line_id, bus_susceptance, upper_line_limit in lines:
            
            f.write("\n"+from_bus+" "+to_bus+" "+line_id+"\t"+bus_susceptance+"\t"+upper_line_limit)
        f.write(";\n\n")

        f.write("param demand :=")
        for bus, demand in demands:
            f.write("\n"+bus+" "+demand)
        f.write(";\n\n")

        f.write("param : min_generation\tmax_generation\tlinear_cost_coeff\t:=")
        for bus, gen_id, min_gen, max_gen, lin_cost_coeff in generators:
            f.write("\n"+bus+" "+gen_id+"\t\t"+min_gen+"\t\t"+max_gen+"\t\t"+lin_cost_coeff)
        f.write(";\n")

if __name__ == "__main__":
    print("Enter the case names without suffix (Eg. Type in 'case14_ieee'). Press enter to start entering second case name. Enter 'done' and press enter to stop entering case names.")
    cases = []
    case = input()
    while case != 'done':
        cases.append(case)
        case = input()
        
    convert(cases)