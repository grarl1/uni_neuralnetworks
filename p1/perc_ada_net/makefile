OUT_DIR = output
DATA_DIR = data
PERC_EXEC = perceptron.m
ADA_EXEC = adaline.m

help:
	@echo "IMPORTANT: This program requires Octave to work\n"
	@echo "Usage: make target\n"
	@echo "Targets available:"
	@echo "\t p1_perceptron: Solves the first real problem using the Perceptron."
	@echo "\t p1_adaline: Solves the first real problem using the Adaline."
	@echo "\t p2_perceptron: Solves the second real problem using the Perceptron."
	@echo "\t p2_adaline: Solves the second real problem using the Adaline."
	@echo "\t plogic: Solves the nand, nor and xor problems using both the Perceptron and the Adaline."
	@echo "\t p2_perc_ada: Classifies the unlabeled data using the Perceptron and the Adaline".
	@echo "\t p_non_linear: Solves the nand, nor, xor and the second real problem adding non linear combinations of the data."
	@echo "Outputs are generated in $(OUT_DIR)."

p1_perceptron: out_dir
	@echo "Solving first problem with the perceptron..."
	@./$(PERC_EXEC) ./$(DATA_DIR)/problema_real1.txt ./$(OUT_DIR)/p1_perc_out 0.1 0.7 50 0

p1_adaline: out_dir
	@echo "Solving first problem with the adaline..."
	@./$(ADA_EXEC) ./$(DATA_DIR)/problema_real1.txt ./$(OUT_DIR)/p1_ada_out 0.01 0.7 50 0.00001

plogic: out_dir
	@echo "Executing perceptron: nand"
	@./$(PERC_EXEC) ./$(DATA_DIR)/nand.txt ./$(OUT_DIR)/plogic_perc_nand_out 0.1 1 20 0
	@echo "Executing perceptron: nor"
	@./$(PERC_EXEC) ./$(DATA_DIR)/nor.txt ./$(OUT_DIR)/plogic_perc_nor_out 0.1 1 20 0
	@echo "Executing perceptron: xor"
	@./$(PERC_EXEC) ./$(DATA_DIR)/xor.txt ./$(OUT_DIR)/plogic_perc_xor_out 0.1 1 20 0
	@echo "Executing adaline: nand"
	@./$(ADA_EXEC) ./$(DATA_DIR)/nand.txt ./$(OUT_DIR)/plogic_ada_nand_out 0.1 1 20 0.00001
	@echo "Executing adaline: nor"
	@./$(ADA_EXEC) ./$(DATA_DIR)/nor.txt ./$(OUT_DIR)/plogic_ada_nor_out 0.1 1 20 0.00001
	@echo "Executing adaline: xor"
	@./$(ADA_EXEC) ./$(DATA_DIR)/xor.txt ./$(OUT_DIR)/plogic_ada_xor_out 0.1 1 20 0.00001

p2_perceptron: out_dir
	@echo "Solving second problem with the perceptron..."
	@./$(PERC_EXEC) ./$(DATA_DIR)/problema_real2.txt ./$(OUT_DIR)/p2_perc_out 0.1 0.7 50 0

p2_adaline: out_dir
	@echo "Solving second problem with the adaline..."
	@./$(ADA_EXEC) ./$(DATA_DIR)/problema_real2.txt ./$(OUT_DIR)/p2_ada_out 0.01 0.7 50 0.00001

p2_perc_ada: out_dir
	@echo "Solving second problem with the perceptron..."
	@./$(PERC_EXEC) ./$(DATA_DIR)/problema_real2.txt ./$(OUT_DIR)/predicciones_perceptron.txt 0.1 1 50 0 ./$(DATA_DIR)/problema_real2_no_etiquetados.txt
	@echo "Solving second problem with the adaline..."
	@./$(ADA_EXEC) ./$(DATA_DIR)/problema_real2.txt ./$(OUT_DIR)/predicciones_adaline.txt 0.01 1 50 0.00001 ./$(DATA_DIR)/problema_real2_no_etiquetados.txt

p_non_linear: out_dir
	@echo "Executing perceptron: nand_non_linear"
	@./$(PERC_EXEC) ./$(DATA_DIR)/nand_non_linear.txt ./$(OUT_DIR)/plogic_perc_nand_non_linear_out 0.1 1 20 0
	@echo "Executing perceptron: nor_non_linear"
	@./$(PERC_EXEC) ./$(DATA_DIR)/nor_non_linear.txt ./$(OUT_DIR)/plogic_perc_nor_non_linear_out 0.1 1 20 0
	@echo "Executing perceptron: xor_non_linear"
	@./$(PERC_EXEC) ./$(DATA_DIR)/xor_non_linear.txt ./$(OUT_DIR)/plogic_perc_xor_non_linear_out 0.1 1 20 0
	@echo "Executing adaline: nand_non_linear"
	@./$(ADA_EXEC) ./$(DATA_DIR)/nand_non_linear.txt ./$(OUT_DIR)/plogic_ada_nand_non_linear_out 0.1 1 20 0.00001
	@echo "Executing adaline: nor_non_linear"
	@./$(ADA_EXEC) ./$(DATA_DIR)/nor_non_linear.txt ./$(OUT_DIR)/plogic_ada_nor_non_linear_out 0.1 1 20 0.00001
	@echo "Executing adaline: xor_non_linear"
	@./$(ADA_EXEC) ./$(DATA_DIR)/xor_non_linear.txt ./$(OUT_DIR)/plogic_ada_xor_non_linear_out 0.1 1 20 0.00001
	@echo "Solving second problem with the perceptron (non linear data)..."
	@./$(PERC_EXEC) ./$(DATA_DIR)/problema_real2_non_linear.txt ./$(OUT_DIR)/p2_perc_non_linear_out 0.1 0.7 50 0
	@echo "Solving second problem with the adaline (non linear data)..."
	@./$(ADA_EXEC) ./$(DATA_DIR)/problema_real2_non_linear.txt ./$(OUT_DIR)/p2_ada_non_linear_out 0.01 0.7 50 0.00001


out_dir:
	@if ! [ -d ./$(OUT_DIR) ]; then \
		echo "Creating output directory ./$(OUT_DIR)" ;\
		mkdir ./$(OUT_DIR) ; \
	fi

compile:
	
all: p1_perceptron p1_adaline p2_perceptron p2_adaline plogic p2_perc_ada p_non_linear
