import { TestAPI } from 'TestAPI';

test('testProtocolImplementation', () => {
    let a = new TestAPI.AProtocolImplementation(
        "Garply",
        false
    );
    expect(a.foo).toEqual("Garply");
    expect(a.baz).toEqual(false);

    let b = a.bar(2, 128);
    expect(b.foo).toEqual("130");
    expect(b.baz).toEqual(true)

    expect(a.hasADefaultImplementation?.(9, -102.1)).toEqual("-312 notBazzed");
    expect(a.hasADefaultImplementation?.(2, 0.345)).toEqual("bazzy 3");

    expect(a.hasADefaultImplementation2?.("923.2185", true, 0.0898714)).toEqual(3.7838466771424932E9);
    expect(a.hasADefaultImplementation2?.("923.2185", false, 0.0898714)).toEqual(1.9556754407899822E-5);

    expect(a.hasADefaultImplementation2?.("0.9870923", true, 1.123123)).toEqual(0.9589049888649063);
    expect(a.hasADefaultImplementation2?.("0.9870923", false, 1.123123)).toEqual(1.686253813623996);
});


test('testProtocolEnum', () => {
    TestAPI.TestProtocolEnum.foo("qux");
    expect(TestAPI.TestProtocolEnum.bar("qux")).toEqual(true);
    TestAPI.TestProtocolEnum.baz("qux", true);
    expect(TestAPI.TestProtocolEnum.garply("qux", "Navigate a nostril!")).toEqual("garply Navigate a nostril! garpity garp");
    expect(TestAPI.TestProtocolEnum.xyzzy("qux", 42, [1.234, 45.235890198, 892.80])).toEqual("thud: 42; grault: [1.234, 45.235890198, 892.8]");
    expect(TestAPI.TestProtocolEnum.plugh("qux", [true, 3.14159265359, ["Take a left at your intestines", "Take the second right past Mars"]])).toEqual([false, 3, "Take a left at your intestines -<*>- Take the second right past Mars"]);
});

test('testProtocolStruct', () => {
    let testProtocolStruct = new TestAPI.TestProtocolStruct("Raft a river of lava-ah!");
    expect(testProtocolStruct.corge).toEqual("Raft a river of lava-ah!");
    testProtocolStruct.corge = "Spank a plankton too! (take that)";
    expect(testProtocolStruct.corge).toEqual("Spank a plankton too! (take that)");
    expect(testProtocolStruct.frob).toEqual([3.14159265359, 42.0, -1.23456789]);
    expect(testProtocolStruct.plugh([true, 42.9, ["Ride on the magic school bus", "You might get baked into a pie"]])).toEqual([true, 51, "Ride on the magic school bus *>-<* You might get baked into a pie"]);

    testProtocolStruct.foo();
    expect(testProtocolStruct.bar()).toEqual(false);
    testProtocolStruct.baz(true);
    expect(testProtocolStruct.garply("An octopus in your neighborhood?")).toEqual("garp garpity An octopus in your neighborhood? garpee");
    expect(testProtocolStruct.xyzzy(42, [1.234, 45.235890198, 892.80])).toEqual("thud: 42 | grault: [1.234, 45.235890198, 892.8]");
});

test('testProtocolClass', () => {
    let testProtocolClass = TestAPI.TestProtocolClass.init("Step inside it's a wilder ride!");
    expect(testProtocolClass.corge).toEqual("Step inside it's a wilder ride!");
    expect(testProtocolClass.frob).toEqual([42.0, -1.23456789, 3.14159265359]);
    expect(testProtocolClass.flarp).toEqual(undefined);
    testProtocolClass.flarp = "Excellent observation Kiki!";
    expect(testProtocolClass.flarp).toEqual("Excellent observation Kiki!");
    expect(testProtocolClass.wombat(undefined)).toEqual(42.909);
    expect(testProtocolClass.wombat(57)).toEqual(undefined);
    expect(testProtocolClass.wombat(56)).toEqual(7890.2);

    expect(testProtocolClass.spqr(new TestAPI.AssociatedDataEnum.Thing(23947889))).toEqual(23947889);
    expect(testProtocolClass.spqr(new TestAPI.AssociatedDataEnum.Other("zxc", 89708973))).toEqual(89708973);
    expect(testProtocolClass.spqr(new TestAPI.AssociatedDataEnum.Bar("shme", new TestAPI.AssociatedDataEnum.NoValue()))).toEqual(45);
    expect(testProtocolClass.spqr(new TestAPI.AssociatedDataEnum.NoValue())).toEqual(42);
    expect(testProtocolClass.spqr(new TestAPI.AssociatedDataEnum.SimpleEnum("blue"))).toEqual(1);

    testProtocolClass.foo();
    expect(testProtocolClass.bar()).toEqual(true);
    testProtocolClass.baz(false);
    expect(testProtocolClass.garply("Surfin' on a sine wave")).toEqual("garplify Surfin' on a sine wave parguino");
    expect(testProtocolClass.xyzzy(42, [1.234, 45.235890198, 892.80])).toEqual("thud: 42 \\|/ grault: [1.234, 45.235890198, 892.8]");
    expect(testProtocolClass.plugh([true, 92.47, ["Please let this be a normal field trip", "I knew I should've stayed home today"]])).toEqual([true, 83, "Please let this be a normal field trip _-^= I knew I should've stayed home today"]);
});

test('testLeadingUnderscoreInNames', () => {
    let lups = new TestAPI.TestLeadingUnderscoredPropStruct("With great power comes great responsibility.");
    expect(lups._leadingUnderscoreProp).toEqual("With great power comes great responsibility.");
});

function makeAsyncForeignSideFunction() {
    return new TestAPI.TestAsyncForeignSideFunctionsStruct(
        async () => { return 49; },
        async (_0) => { return Math.abs(_0); },
        (f, g) => {
            return async (x: number) => {
                return f(await g(x));
            }
        },
        async (x, y, z) => {
            return x + y + z;
        },
        async (a, b, c, d) => {
            return [a, b, c, d];
        },
        async (a, b, c, d, e) => {
            return e;
        },
        async (a, b, c, d, e, f) => {
            return f;
        },
        async () => {
            throw new Error("Spoon!");
        },
        async (fn) => {
            return `${await fn() * 2}`;
        },
        async (fn) => {
            return `${await fn(-7)}`;
        },
        async (fn) => {
            return `${await fn(async (a) => { return a + 1; }, async (b) => { return b * 3; })(23)}`;
        },
        async (fn) => {
            return `${await fn(1.0, 4.4, 2)}`;
        },
        async (fn) => {
            return `${await fn("Pump", "up", "the", "jam")}`;
        },
        async (fn) => {
            let y = await (await fn("78", 6, 4.2, "12", async () => { return 654; }))();
            return `${y}`;
        },
        async (fn) => {
            let y = await fn("78", 6, 4.2, "12", async () => { return 654; }, 98);
            return `${y}`;
        },
        (thunk) => {
            return async () => {
                thunk();
                thunk();
            };
        }
    )
}

function sleep(ms: number) {
    return new Promise(resolve => setTimeout(resolve, ms));
}

async function testAsyncForeignSideFunctionsCore(a: TestAPI.TestAsyncFunctions) {
    expect(a.const42()).resolves.toEqual(49);
    expect(a.iabs(-2398)).resolves.toEqual(2398);
    let b = a.intCompose(
        async (x) => {
            sleep(1);
            return x * 3;
        },
        async (y) => {
            sleep(1);
            return y * 5;
        }
    );
    expect(b(92)).resolves.toEqual(1380);
    let d = a.makeList("By", "your", "powers", "combined");
    expect(d).resolves.toEqual(["By", "your", "powers", "combined"]);
    let e = await a.fifthThing(
        "I, am",
        Number.MAX_SAFE_INTEGER,
        Number.MIN_VALUE,
        "Captain Planet!",
        async () => {
            sleep(1);
            return 42;
        }
    );
    expect(await e()).toEqual(42);
    let f = await a.six(
        "Big, bad",
        24,
        3.14159265359,
        "Beetleborgs",
        async () => {
            sleep(1);
            return 43;
        },
        Number.MIN_SAFE_INTEGER
    );
    expect(f).toEqual(Number.MIN_SAFE_INTEGER);

    expect(a.willThrow()).rejects.toThrowError("Spoon!")

    let g = await a.exercise0(e);
    expect(g).toEqual("84");
    let h = await a.exercise1(b);
    expect(h).toEqual("-105");

    let i = await a.exercise2(
        (a, b) => {
            return async (z) => {
                return (await a(3)) + (await b(3)) + z;
            }
        }
    );
    expect(i).toEqual("36");

    let j = await a.exercise3(
        async (fl, d, l) => {
            return (fl / d) + (9 * l);
        }
    );
    expect(j).toEqual("18.227272727272727");

    let k = await a.exercise4(
        async (a, b, c, d) => {
            return [d, c, b, a];
        }
    );
    expect(k).toEqual("jam,the,up,Pump");

    let l = await a.exercise5(
        async (a, b, c, d, e) => {
            return async () => {
                return Math.floor(Number(a) + Number(b) + c + Number(d) + (await e()));
            }
        }
    );
    expect(l).toEqual("754");

    let m = await a.exercise6(
        async (a, b, c, d, e, f) => {
            return Math.floor(Number(a) + Number(b) + c + Number(d) + (await e()) + f);
        }
    );
    expect(m).toEqual("852");

    let o = 1;
    let n = a.thunkTwiceMaker(
        async () => {
            o += 1;
            console.log("Thunker in paradise");
        }
    );
    await n();
    sleep(1);
    expect(o).toEqual(3);

    let p = await a.defaultExercise6?.(
        async (a, b, c, d, e, f) => {
            return Math.floor(Number(a) + Number(b) + c + Number(d) + (await e()) + f);
        }
    );
    expect(p).toEqual("962");
}

test('testAsyncForeignSideFunctions', async () => {
    let a = makeAsyncForeignSideFunction();
    await testAsyncForeignSideFunctionsCore(a);
});

test('testAsyncForeignSideFunctionsWitness', async () => {
    let _a = makeAsyncForeignSideFunction();
    let a = _a.witness()
    await testAsyncForeignSideFunctionsCore(a);
});

async function testAsyncSwiftSideFunctionsCore(a: TestAPI.TestAsyncFunctions) {
    expect(a.const42()).resolves.toEqual(42);
    expect(a.iabs(-2398)).resolves.toEqual(2398);
    let b = a.intCompose(
        async (x) => {
            sleep(1);
            return x * 3;
        },
        async (y) => {
            sleep(1);
            return y * 5;
        }
    );
    expect(b(92)).resolves.toEqual(1380);
    let d = a.makeList("By", "your", "powers", "combined");
    expect(d).resolves.toEqual(["By", "your", "powers", "combined"]);
    let e = await a.fifthThing(
        "I, am",
        Number.MAX_SAFE_INTEGER,
        Number.MIN_VALUE,
        "Captain Planet!",
        async () => {
            sleep(1);
            return 42;
        }
    );
    expect(await e()).toEqual(42);
    let f = await a.six(
        "Big, bad",
        24,
        3.14159265359,
        "Beetleborgs",
        async () => {
            sleep(1);
            return 43;
        },
        Number.MIN_SAFE_INTEGER
    );
    expect(f).toEqual(Number.MIN_SAFE_INTEGER);

    expect(a.willThrow()).rejects.toThrowError("The operation couldn’t be completed. (TestAPI.AsyncFunctions.TheAsyncError error 1.)")

    let g = await a.exercise0(e);
    expect(g).toEqual("42");
    let h = await a.exercise1(b);
    expect(h).toEqual("-45");

    let i = await a.exercise2(
        (a, b) => {
            return async (z) => {
                return (await a(3)) + (await b(3)) + z;
            }
        }
    );
    expect(i).toEqual("21");

    let j = await a.exercise3(
        async (fl, d, l) => {
            return (fl / d) + (9 * l);
        }
    );
    expect(j).toEqual("18.227272727272727");

    let k = await a.exercise4(
        async (a, b, c, d) => {
            return [d, c, b, a];
        }
    );
    expect(k).toEqual("[\"d\", \"c\", \"b\", \"a\"]");

    let l = await a.exercise5(
        async (a, b, c, d, e) => {
            return async () => {
                return Math.floor(Number(b) + c + (await e()));
            }
        }
    );
    expect(l).toEqual("93");

    let m = await a.exercise6(
        async (a, b, c, d, e, f) => {
            return Math.floor(Number(b) + c + (await e()) + f);
        }
    );
    expect(m).toEqual("135");

    let o = 3.14159265359;
    let n = a.thunkTwiceMaker(
        async () => {
            o = o * o;
            console.log("Thunkmaster thex");
        }
    );
    await n();
    sleep(1);
    expect(o).toEqual(97.4090910340281);

    let p = await a.defaultExercise6?.(
        async (a, b, c, d, e, f) => {
            return Math.floor(Number(a) + Number(b) + c + Number(d) + (await e()) + f);
        }
    );
    expect(p).toEqual("962");
}

test('testAsyncSwiftSideFunctions', async () => {
    let a = TestAPI.TestAsyncSwiftSideFunctionsClass.init();
    await testAsyncSwiftSideFunctionsCore(a);
});

test('testAsyncSwiftSideFunctionsWitness', async () => {
    let _a = TestAPI.TestAsyncSwiftSideFunctionsClass.init();
    let a = _a.witness()
    await testAsyncSwiftSideFunctionsCore(a);
});

class TestAsyncFunctionsImpl implements TestAPI.TestAsyncFunctions {
    get const42(): () => Promise<number> {
        return async () => { return 49; };
    }
    get iabs(): (_0: number) => Promise<number> {
        return async (_0) => { return Math.abs(_0); }
    };
    get intCompose(): (_0: (_0: number) => Promise<number>, _1: (_0: number) => Promise<number>) => (_0: number) => Promise<number> {
        return (f, g) => {
            return async (x: number) => {
                return f(await g(x));
            }
        };
    };
    get add3Things(): (_0: number, _1: number, _2: number) => Promise<number> {
        return async (x, y, z) => {
            return x + y + z;
        }
    };
    get makeList(): (_0: string, _1: string, _2: string, _3: string) => Promise<string[]> {
        return async (a, b, c, d) => {
            return [a, b, c, d];
        }
    };
    get fifthThing(): (_0: string, _1: number, _2: number, _3: string, _4: () => Promise<number>) => Promise<() => Promise<number>> {
        return async (a, b, c, d, e) => {
            return e;
        }
    };
    get six(): (_0: string, _1: number, _2: number, _3: string, _4: () => Promise<number>, _5: number) => Promise<number> {
        return async (a, b, c, d, e, f) => {
            return f;
        }
    };
    get willThrow(): () => Promise<number> {
        return async () => {
            throw new Error("Spoon!");
        }
    };
    async exercise0(fn: () => Promise<number>): Promise<string> {
        return `${(await fn()) * 2}`;
    }
    async exercise1(fn: (_0: number) => Promise<number>): Promise<string> {
        return `${await fn(-7)}`;
    }
    async exercise2(fn: (_0: (_0: number) => Promise<number>, _1: (_0: number) => Promise<number>) => (_0: number) => Promise<number>): Promise<string> {
        return `${await fn(async (a) => { return a + 1; }, async (b) => { return b * 3; })(23)}`;
    }
    async exercise3(fn: (_0: number, _1: number, _2: number) => Promise<number>): Promise<string> {
        return `${await fn(1.0, 4.4, 2)}`;
    }
    async exercise4(fn: (_0: string, _1: string, _2: string, _3: string) => Promise<string[]>): Promise<string> {
        return `${await fn("Pump", "up", "the", "jam")}`;
    }
    async exercise5(fn: (_0: string, _1: number, _2: number, _3: string, _4: () => Promise<number>) => Promise<() => Promise<number>>): Promise<string> {
        let y = await (await fn("78", 6, 4.2, "12", async () => { return 654; }))();
        return `${y}`;
    }
    async exercise6(fn: (_0: string, _1: number, _2: number, _3: string, _4: () => Promise<number>, _5: number) => Promise<number>): Promise<string> {
        let y = await fn("78", 6, 4.2, "12", async () => { return 654; }, 98);
        return `${y}`;
    }
    thunkTwiceMaker(thunk: () => Promise<void>): () => Promise<void> {
        return async () => {
            thunk();
            thunk();
        };
    }
    // defaultExercise6?(fn: (_0: string, _1: number, _2: number, _3: string, _4: () => Promise<number>, _5: number) => Promise<number>): Promise<string> {
    //     throw new Error('Method not implemented.');
    // }
    witness(): TestAPI.TestAsyncFunctions {
        return new TestAsyncFunctionsImpl();
    }    
}

test('testAsyncFunctionsImpl', async () => {
    let a = new TestAsyncFunctionsImpl();
    await testAsyncForeignSideFunctionsCore(a);
});

test('testAsyncFunctionsImplWitness', async () => {
    let _a = new TestAsyncFunctionsImpl();
    let a = _a.witness()
    await testAsyncForeignSideFunctionsCore(a);
});