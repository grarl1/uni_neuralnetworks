BP_EXEC = bp.m
BP_PRED_EXEC = bp_pred.m
DATA_DIR = ../data
OUTPUT_DIR = ../output
PR1_IN = $(DATA_DIR)/alfabeto.txt
PR1_OUT = $(OUTPUT_DIR)/tarea1.out

help:
	@echo "IMPORTANT: This program requires Octave to work.\n"
	@echo "Usage: make target\n"
	@echo "Targets available:"
	@echo "\t tarea1_1: Alphabet w/o noise."
	@echo "\t tarea1_2: Alphabet: training without noise, test with noise."
	@echo "\t tarea1_3: Alphabet: training and test with noise."
	@echo "Outputs are generated in $(OUTPUT_DIR)."

all: tarea1_1 tarea1_2 tarea1_3

out_dir:
	@if ! [ -d ./$(OUTPUT_DIR) ]; then \
		echo "Creating output directory $(OUTPUT_DIR)" ;\
		mkdir ./$(OUTPUT_DIR) ; \
	fi

# bp.m input_path output_path training_percentage alpha hidden_layer_n f_training f_test
tarea1_1: out_dir
	./$(BP_EXEC) $(PR1_IN) $(PR1_OUT) 100 0.01 10 0 0
	./$(BP_EXEC) $(PR1_IN) $(PR1_OUT) 100 0.01 15 0 0
	./$(BP_EXEC) $(PR1_IN) $(PR1_OUT) 100 0.01 18 0 0
	./$(BP_EXEC) $(PR1_IN) $(PR1_OUT) 100 0.01 20 0 0
	./$(BP_EXEC) $(PR1_IN) $(PR1_OUT) 100 0.01 25 0 0
	./$(BP_EXEC) $(PR1_IN) $(PR1_OUT) 100 0.01 30 0 0
	./$(BP_EXEC) $(PR1_IN) $(PR1_OUT) 100 0.01 35 0 0

tarea1_2:
	./$(BP_EXEC) $(PR1_IN) $(PR1_OUT) 100 0.01 25 0 1
	./$(BP_EXEC) $(PR1_IN) $(PR1_OUT) 100 0.01 25 0 1
	./$(BP_EXEC) $(PR1_IN) $(PR1_OUT) 100 0.01 25 0 1
	./$(BP_EXEC) $(PR1_IN) $(PR1_OUT) 100 0.01 25 0 3
	./$(BP_EXEC) $(PR1_IN) $(PR1_OUT) 100 0.01 25 0 3
	./$(BP_EXEC) $(PR1_IN) $(PR1_OUT) 100 0.01 25 0 3
	./$(BP_EXEC) $(PR1_IN) $(PR1_OUT) 100 0.01 25 0 5
	./$(BP_EXEC) $(PR1_IN) $(PR1_OUT) 100 0.01 25 0 5
	./$(BP_EXEC) $(PR1_IN) $(PR1_OUT) 100 0.01 25 0 5

tarea1_3:
	./$(BP_EXEC) $(PR1_IN) $(PR1_OUT) 100 0.01 25 1 1
	./$(BP_EXEC) $(PR1_IN) $(PR1_OUT) 100 0.01 25 1 1
	./$(BP_EXEC) $(PR1_IN) $(PR1_OUT) 100 0.01 25 1 1
	./$(BP_EXEC) $(PR1_IN) $(PR1_OUT) 100 0.01 25 3 3
	./$(BP_EXEC) $(PR1_IN) $(PR1_OUT) 100 0.01 25 3 3
	./$(BP_EXEC) $(PR1_IN) $(PR1_OUT) 100 0.01 25 3 3
	./$(BP_EXEC) $(PR1_IN) $(PR1_OUT) 100 0.01 25 5 5
	./$(BP_EXEC) $(PR1_IN) $(PR1_OUT) 100 0.01 25 5 5
	./$(BP_EXEC) $(PR1_IN) $(PR1_OUT) 100 0.01 25 5 5
