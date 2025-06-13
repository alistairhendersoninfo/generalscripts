import argparse
from pathlib import Path

from pdfminer.high_level import extract_text


def pdf_to_totex(input_path: Path, output_path: Path) -> None:
    """Extract text from a PDF and save it to output_path as TOTEX."""
    text = extract_text(str(input_path))
    output_path.write_text(text, encoding="utf-8")


def main() -> None:
    parser = argparse.ArgumentParser(description="Convert PDF to TOTEX (plain text)")
    parser.add_argument("input_pdf", type=Path, help="Input PDF file")
    parser.add_argument("output_totex", type=Path, help="Output TOTEX file (.totex)")
    args = parser.parse_args()

    pdf_to_totex(args.input_pdf, args.output_totex)


if __name__ == "__main__":
    main()
