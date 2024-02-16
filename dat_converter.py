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
        # [from_bus, to_bus, id, reactance, lower_line_limit, upper_line_limit]
        max_bus = 1
        max_line_id = 1
        for line in bra_file.readlines():
            parsed_line = line.strip().split(',')
            from_bus, to_bus, line_id, reactance, lower_line_limit, upper_line_limit = parsed_line
            max_bus = max(max_bus, int(from_bus), int(to_bus))
            max_line_id = max(max_line_id, int(line_id))
            lines.append(parsed_line)
        
        demands = []
        # skip first line (headers)
        next(dem_file)
        # [bus, demand]
        for line in dem_file.readlines():
            demands.append(line.strip().split(','))

        generators = []
        # skip first line (headers)
        next(gen_file)
        # [bus, id, min_gen, max_gen, lin_cost_coeff]
        max_gen_id = 1
        for line in gen_file.readlines():
            parsed_line = line.strip().split(',')
            bus, gen_id, min_gen, max_gen, lin_cost_coeff = parsed_line
            max_gen_id = max(max_gen_id, int(gen_id))
            generators.append(parsed_line)


        # Writing dat file
            
        f = open(case+".dat", "w")
        f.write("set BUSES :=")
        set_init(f, max_bus)
        f.write("set LINE_IDS :=")
        set_init(f, max_line_id)
        f.write("set GENERATOR_IDS :=")
        set_init(f, max_gen_id)
    


if __name__ == "__main__":
    print("Enter the case names without suffix (Eg. Type in 'case14_ieee'). Press enter to start entering second case name. Enter 'done' and press enter to stop entering case names.")
    cases = []
    case = input()
    while case != 'done':
        cases.append(case)
        case = input()
        
    convert(cases)