BP_EXEC = bp.m
BP_PRED_EXEC = bp_pred.m
SERIES_EXEC = series.m
SERIES_REC_EXEC = series_recursive.m
ADAPTA_EXEC = adapta_fichero.m
DATA_DIR = ../data
OUTPUT_DIR = ../output
PR1_IN = $(DATA_DIR)/alfabeto.txt
PR1_OUT = $(OUTPUT_DIR)/tarea1.out
PR2_1_IN = $(DATA_DIR)/p3_serie1.txt
PR2_1_OUT = $(DATA_DIR)/p3_serie1_adaptado.txt
PR2_4_IN = $(PR2_1_OUT)
PR2_4_OUT = $(OUTPUT_DIR)/p3_serie1_out
PR2_9_IN = $(PR2_1_OUT)
PR2_9_OUT = $(OUTPUT_DIR)/p3_serie1_recursiv
PR2_10_BASE = $(DATA_DIR)/p3_serie2.txt
PR2_10_IN = $(DATA_DIR)/p3_serie2_adaptado.txt
PR2_10_OUT = $(OUTPUT_DIR)/p3_serie2_out

help:
	@echo "IMPORTANT: This program requires Octave to work.\n"
	@echo "Usage: make target\n"
	@echo "Targets available:"
	@echo "\t tarea1_1: Alphabet w/o noise."
	@echo "\t tarea1_2: Alphabet: training without noise, test with noise."
	@echo "\t tarea1_3: Alphabet: training and test with noise."
	@echo "\t tarea2_4: Series: Predictions with several training percentages for several number of inputs."
	@echo "\t tarea2_9: Series: Recursive predictions for p3_serie1."
	@echo "\t tarea2_10: Series: Predictions for p3_serie2."
	@echo "\t tarea2_10: Series: Recursive predictions for p3_serie2."
	@echo "Outputs are generated in $(OUTPUT_DIR)."

all: tarea1_1 tarea1_2 tarea1_3 tarea2_4 tarea2_9 tarea2_10 tarea2_10_rec

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

tarea1_2: out_dir
	./$(BP_EXEC) $(PR1_IN) $(PR1_OUT) 100 0.01 25 0 1
	./$(BP_EXEC) $(PR1_IN) $(PR1_OUT) 100 0.01 25 0 1
	./$(BP_EXEC) $(PR1_IN) $(PR1_OUT) 100 0.01 25 0 1
	./$(BP_EXEC) $(PR1_IN) $(PR1_OUT) 100 0.01 25 0 3
	./$(BP_EXEC) $(PR1_IN) $(PR1_OUT) 100 0.01 25 0 3
	./$(BP_EXEC) $(PR1_IN) $(PR1_OUT) 100 0.01 25 0 3
	./$(BP_EXEC) $(PR1_IN) $(PR1_OUT) 100 0.01 25 0 5
	./$(BP_EXEC) $(PR1_IN) $(PR1_OUT) 100 0.01 25 0 5
	./$(BP_EXEC) $(PR1_IN) $(PR1_OUT) 100 0.01 25 0 5

tarea1_3: out_dir
	./$(BP_EXEC) $(PR1_IN) $(PR1_OUT) 100 0.01 25 1 1
	./$(BP_EXEC) $(PR1_IN) $(PR1_OUT) 100 0.01 25 1 1
	./$(BP_EXEC) $(PR1_IN) $(PR1_OUT) 100 0.01 25 1 1
	./$(BP_EXEC) $(PR1_IN) $(PR1_OUT) 100 0.01 25 3 3
	./$(BP_EXEC) $(PR1_IN) $(PR1_OUT) 100 0.01 25 3 3
	./$(BP_EXEC) $(PR1_IN) $(PR1_OUT) 100 0.01 25 3 3
	./$(BP_EXEC) $(PR1_IN) $(PR1_OUT) 100 0.01 25 5 5
	./$(BP_EXEC) $(PR1_IN) $(PR1_OUT) 100 0.01 25 5 5
	./$(BP_EXEC) $(PR1_IN) $(PR1_OUT) 100 0.01 25 5 5

tarea2_4: out_dir
	#Na = 1, Ns 1
	./$(ADAPTA_EXEC) $(PR2_1_IN) $(PR2_1_OUT) 1 1
	./$(SERIES_EXEC) $(PR2_4_IN) $(PR2_4_OUT) 50 0.05 1
	./$(SERIES_EXEC) $(PR2_4_IN) $(PR2_4_OUT) 25 0.05 1
	#Na = 2, Ns 1
	./$(ADAPTA_EXEC) $(PR2_1_IN) $(PR2_1_OUT) 2 1
	./$(SERIES_EXEC) $(PR2_4_IN) $(PR2_4_OUT) 50 0.05 1
	./$(SERIES_EXEC) $(PR2_4_IN) $(PR2_4_OUT) 25 0.05 1
	#Na = 5, Ns 1
	./$(ADAPTA_EXEC) $(PR2_1_IN) $(PR2_1_OUT) 5 1
	./$(SERIES_EXEC) $(PR2_4_IN) $(PR2_4_OUT) 50 0.05 1
	./$(SERIES_EXEC) $(PR2_4_IN) $(PR2_4_OUT) 25 0.05 1

tarea2_9: out_dir
	./$(ADAPTA_EXEC) $(PR2_1_IN) $(PR2_9_IN) 5 1
	./$(SERIES_REC_EXEC) $(PR2_9_IN) $(PR2_9_OUT) 50 0.05 10 20
	./$(SERIES_REC_EXEC) $(PR2_9_IN) $(PR2_9_OUT) 50 0.05 10 60
	./$(SERIES_REC_EXEC) $(PR2_9_IN) $(PR2_9_OUT) 50 0.05 10 100
	./$(SERIES_REC_EXEC) $(PR2_9_IN) $(PR2_9_OUT) 50 0.05 10 140

tarea2_10: out_dir
	#Na = 1, Ns 1
	./$(ADAPTA_EXEC) $(PR2_10_BASE) $(PR2_10_IN) 1 1
	./$(SERIES_EXEC) $(PR2_10_IN) $(PR2_10_OUT) 50 0.05 5
	#Na = 2, Ns 1
	./$(ADAPTA_EXEC) $(PR2_10_BASE) $(PR2_10_IN) 2 1
	./$(SERIES_EXEC) $(PR2_10_IN) $(PR2_10_OUT) 50 0.05 5
	#Na = 5, Ns 1
	./$(ADAPTA_EXEC) $(PR2_10_BASE) $(PR2_10_IN) 5 1
	./$(SERIES_EXEC) $(PR2_10_IN) $(PR2_10_OUT) 50 0.05 5

tarea2_10_rec: out_dir
	./$(ADAPTA_EXEC) $(PR2_10_BASE) $(PR2_10_IN) 5 1
	./$(SERIES_REC_EXEC) $(PR2_10_IN) $(PR2_10_OUT) 50 0.05 5 20
