# Telemetry Memory usage

Analyse a Firefox Memory Report and show the detailed memory usage of the Telemetry module.

It shows the same data `about:memory` shows for a verbose Memory Report, but only for the Telemetry module.

## Usage

```
gzcat memory-report.json.gz | ruby mem-usage -
```

## Example output

```
$ gzcat ~/memory-report.json.gz| ruby mem-usage.rb  -
Main Process: 266424 (100.00%)
  telemetry: 266424 (100.00%)
    impl: 464 (0.17%)
    histogram: 236352 (88.71%)
      shallow: 0 (0.00%)
      data: 236352 (88.71%)
    scalar: 8832 (3.32%)
      shallow: 8192 (3.07%)
      data: 640 (0.24%)
    WebRTC: 0 (0.00%)
    PrivateSQL: 0 (0.00%)
    SanitizedSQL: 0 (0.00%)
    IOObserver: 576 (0.22%)
    StackCapturer: 0 (0.00%)
    LateWritesStacks: 0 (0.00%)
    Callbacks: 0 (0.00%)
    event: 20200 (7.58%)
      data: 20200 (7.58%)

Web Content: 25520 (100.00%)
  telemetry: 25520 (100.00%)
    impl: 464 (1.82%)
    histogram: 0 (0.00%)
      shallow: 0 (0.00%)
      data: 0 (0.00%)
    scalar: 8192 (32.10%)
      shallow: 8192 (32.10%)
      data: 0 (0.00%)
    WebRTC: 0 (0.00%)
    PrivateSQL: 0 (0.00%)
    SanitizedSQL: 0 (0.00%)
    StackCapturer: 0 (0.00%)
    LateWritesStacks: 0 (0.00%)
    Callbacks: 0 (0.00%)
    event: 16864 (66.08%)
      data: 16864 (66.08%)
```

## License

MPL. See [LICENSE](LICENSE).
Copyright (c) 2018 Jan-Erik Rediger <janerik@fnordig.de>
