# Progress Bar for Multiprocessing

Using `tqdm.tqdm` with `multiprocessing.imap` we can present to users a progress
bar for parallel their computation.

```python
import mulitprocessing as mp
from tqdm import tqdm

def process(data):
    result = data + 1
    return result

N = 100
data = [i for i in range(N)]
results = [] 

if __name__ == '__main__':
    with mp.Pool(mp.cpu_count()) as pool:
        results = list(tqdm(pool.imap(process, data), total=len(data)))
    for item in results:
        print(item)
```

## References

  - [SO](https://stackoverflow.com/questions/41920124/multiprocessing-use-tqdm-to-display-a-progress-bar)
