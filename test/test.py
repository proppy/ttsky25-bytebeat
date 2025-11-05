# Copyright 2023 Google LLC.
# SPDX-License-Identifier: Apache-2.0

import cocotb
from cocotb.clock import Clock
from cocotb.triggers import ClockCycles, RisingEdge

import numpy as np
import scipy.io.wavfile
import pandas as pd
import matplotlib.pyplot as plt


FREQ = 8000


async def collect_samples(dut, count):
    for i in range(count):
        await RisingEdge(dut.clk) # wait for first clock edge
        try:
            s = dut.uo_out.value.to_unsigned()
        except ValueError:
            pass  # ignore invalid samples
        yield (i, s)


async def write_wavefile(dut):
    """Write a wavefile corresponding to the outputs."""
    samples = [s async for s in collect_samples(dut, 65536*2)]
    df = pd.DataFrame.from_records(samples, columns=['t', 'out0'], index=['t'])
    df.plot()
    plt.savefig('tb.png')
    samples = df['out0'][:]
    scipy.io.wavfile.write('tb.wav', 8000, samples.to_numpy(dtype=np.uint8))


@cocotb.test()
async def test_bytebeat(dut):
    dut._log.info("Start")

    cocotb.start_soon(write_wavefile(dut))  # collect samples "in the background"

    # Set the clock to 8000hz
    clock = Clock(dut.clk, (1.0/FREQ), unit="sec")
    cocotb.start_soon(clock.start())

    dut.ena.value = 1 # enable project
    dut.rst_n.value = 0 # low to reset
    dut.ui_in.value = 0x57  # a=5 b=7
    dut.uio_in.value = 0x3a # c=3 d=10
    await ClockCycles(dut.clk, 1)
    dut.rst_n.value = 1 # take out of reset
    await ClockCycles(dut.clk, 65536)
    dut.rst_n.value = 0 # low to reset
    dut.ui_in.value = 0x36  # a=3 b=6
    dut.uio_in.value = 0x29 # c=2 d=9
    await ClockCycles(dut.clk, 1)
    dut.rst_n.value = 1 # take out of reset
    await ClockCycles(dut.clk, 65536)
