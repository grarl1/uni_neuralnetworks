OUT_DIR = output
DATA_DIR = data
PERC_EXEC = perceptron.m
ADA_EXEC = adaline.m

help:
	@echo "IMPORTANT: This program requires Octave to work\n"
	@echo "Usage: Makefile target\n"
	@echo "Targets available: p1 p2 p4 p5 p6"
	@echo "\t Each target solves a problem given in the assginment generating output in"
	@echo "\t /$(OUT_DIR)"

p1: out_dir
	@echo "Executing p1"
	@./$(PERC_EXEC) ./$(DATA_DIR)/problema_real1.txt ./$(OUT_DIR)/p1_perc_out 0.1 0.7 50 0

p2: out_dir
	@echo "Executing p2"
	@./$(ADA_EXEC) ./$(DATA_DIR)/problema_real1.txt ./$(OUT_DIR)/p2_ada_out 0.01 0.7 50 0.00001

p4: out_dir
	@echo "Executing p4 perceptron nand"
	@./$(PERC_EXEC) ./$(DATA_DIR)/nand.txt ./$(OUT_DIR)/p4_perc_nand_out 0.1 1 20 0
	@echo "Executing p4 perceptron nor"
	@./$(PERC_EXEC) ./$(DATA_DIR)/nor.txt ./$(OUT_DIR)/p4_perc_nor_out 0.1 1 20 0
	@echo "Executing p4 perceptron xor"
	@./$(PERC_EXEC) ./$(DATA_DIR)/xor.txt ./$(OUT_DIR)/p4_perc_xor_out 0.1 1 20 0
	@echo "Executing p4 adaline nand"
	@./$(ADA_EXEC) ./$(DATA_DIR)/nand.txt ./$(OUT_DIR)/p4_ada_nand_out 0.1 1 20 0.00001
	@echo "Executing p4 adaline nor"
	@./$(ADA_EXEC) ./$(DATA_DIR)/nor.txt ./$(OUT_DIR)/p4_ada_nor_out 0.1 1 20 0.00001
	@echo "Executing p4 adaline xor"
	@./$(ADA_EXEC) ./$(DATA_DIR)/xor.txt ./$(OUT_DIR)/p4_ada_xor_out 0.1 1 20 0.00001

p5: out_dir
	@echo "Executing p5 for perceptron"
	@./$(PERC_EXEC) ./$(DATA_DIR)/problema_real2.txt ./$(OUT_DIR)/predicciones_perceptron.txt 0.1 1 50 0 ./$(DATA_DIR)/problema_real2_no_etiquetados.txt
	@echo "Executing p5 for adaline"
	@./$(ADA_EXEC) ./$(DATA_DIR)/problema_real2.txt ./$(OUT_DIR)/predicciones_adaline.txt 0.01 1 50 0.00001 ./$(DATA_DIR)/problema_real2_no_etiquetados.txt

p6: out_dir

out_dir:
	@if ! [ -d ./$(OUT_DIR) ]; then \
		echo "Creating output directory ./$(OUT_DIR)" ;\
		mkdir ./$(OUT_DIR) ; \
	fi

all: p1 p2 p4 p5 p6