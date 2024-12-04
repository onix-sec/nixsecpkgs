#!/bin/env python3

from pof.utils.se import HomoglyphsGenerator


def get_homoglyphs(text: str, amount: int) -> None:
    generator = HomoglyphsGenerator()
    for _ in range(amount):
        homoglyph = generator.get_single_homoglyph(text)
        print(homoglyph)


if __name__ == "__main__":
    import sys

    if len(sys.argv) == 1 or sys.argv[1] == "--help":
        print(f"usage: {sys.argv[0]} [text] [amount?]")

        if len(sys.argv) == 1:
            print("missing text")

        sys.exit(1)

    text = sys.argv[1]

    amount = 1
    if len(sys.argv) > 2:
        try:
            amount = int(sys.argv[2])
        except Exception as e:
            print("the amount must be a number")
            print(str(e))
            sys.exit(1)

    get_homoglyphs(text, amount)
