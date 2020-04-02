# `mynewt-btshell`

> Standalone repository for building and flashing `btshell`

## Building

Running the bootstrap script will create the project and build:

```shell
./bootstrap.sh
```

## Flashing

With an `nrf52840dk` board plugged in via USB, run:

```shell
./flash.sh
```

## Serial

Once the board is flashed, you can access serial console via a tool like
`picocom`:

```shell
$ picocom -b 115200 /dev/ttyACM1

033223 btshell>
```

## Additional Information

See some of the [official API docs][api-docs] for usage examples.

[api-docs]: https://github.com/apache/mynewt-nimble/tree/master/docs/btshell
