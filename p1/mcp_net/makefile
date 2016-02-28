EXEC_NAME = mp.m
INPUT_FILE = input_file
OUTPUT_FILE = output_file

help:
	@echo "IMPORTANT: This program requires Octave to work\n"
	@echo "Usage: make mccullogh INPUT_FILE=input_file OUTPUT_FILE=output_file\n"
	@echo "mccullogh: Executes mp.m to solve the displacing bit problem taking"
	@echo "inputs from INPUT_FILE and writing output to OUTPUT_FILE\n"

mccullogh:
	@./$(EXEC_NAME) $(INPUT_FILE) $(OUTPUT_FILE)
	@echo "Wrote to $(OUTPUT_FILE)"
