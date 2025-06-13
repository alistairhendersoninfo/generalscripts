# PDF-TO-TOTEX

This environment contains a small utility to convert PDF files to a simple text-based format called **TOTEX**. The TOTEX format in this repository is just plain text extracted from the PDF. The script uses `pdfminer.six` to read the PDF contents.

## Usage

```bash
pip install -r requirements.txt
python pdf_to_totex.py input.pdf output.totex
```

The output is a text file with the `.totex` extension containing the extracted text.
