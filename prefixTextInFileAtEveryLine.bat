
(for /f "delims=" %%L in (input_file_name.txt) do @echo <prefix with word> %%L) > output_filename.txt
mv output_filename.txt input_file_name.txt
