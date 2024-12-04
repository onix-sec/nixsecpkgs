#!/bin/env python
"""Calculate the Shannon entropy of a file.

- https://practicalsecurityanalytics.com/file-entropy/
"""

import collections
import math
from pathlib import Path


def shanon_entropy(data: str) -> float:
    count = collections.Counter(map(ord, data))
    pk = [x / sum(count.values()) for x in count.values()]
    return -sum([p * math.log(p) / math.log(2) for p in pk])


if __name__ == "__main__":
    import sys

    if len(sys.argv) == 1 or sys.argv[1] == "--help":
        print(f"usage: {sys.argv[0]} [file]")

        if len(sys.argv) == 1:
            print("missing file path")

        sys.exit(1)

    file = Path(sys.argv[1])

    try:
        with file.open() as f:
            content = f.read()
    except Exception as e:
        print(str(e))
        sys.exit(1)

    e = shanon_entropy(content)

    sys.stdout.write(f"{file} entropy: {e:1.3f}\n")
