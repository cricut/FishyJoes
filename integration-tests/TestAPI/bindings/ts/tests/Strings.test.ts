import { TestAPI } from 'TestAPI';

test('StringValues', () => {
    expect(TestAPI.Strings.simple).toEqual("Hello")
    expect(TestAPI.Strings.accent).toEqual("Olá")
    expect(TestAPI.Strings.script).toEqual("こんにちは")
    expect(TestAPI.Strings.chinese).toEqual("你好")
    expect(TestAPI.Strings.chineseBMP).toEqual("豈更車賈滑")
    expect(TestAPI.Strings.chineseSIP).toEqual("\u{20001}\u{20002}\u{20003}\u{20004}")
    expect(TestAPI.Strings.emoji).toEqual("🤯🐶🍓")
    expect(TestAPI.Strings.emojiMulti).toEqual("👨‍👩‍👧‍👦👍🏿🇺🇸")
});

test('StringEcho', () => {
    expect(TestAPI.Strings.echo(TestAPI.Strings.simple)).toEqual(TestAPI.Strings.simple)
    expect(TestAPI.Strings.echo(TestAPI.Strings.accent)).toEqual(TestAPI.Strings.accent)
    expect(TestAPI.Strings.echo(TestAPI.Strings.chinese)).toEqual(TestAPI.Strings.chinese)
    expect(TestAPI.Strings.echo(TestAPI.Strings.chineseBMP)).toEqual(TestAPI.Strings.chineseBMP)
    expect(TestAPI.Strings.echo(TestAPI.Strings.chineseSIP)).toEqual(TestAPI.Strings.chineseSIP)
    expect(TestAPI.Strings.echo(TestAPI.Strings.emoji)).toEqual(TestAPI.Strings.emoji)
    expect(TestAPI.Strings.echo(TestAPI.Strings.emojiMulti)).toEqual(TestAPI.Strings.emojiMulti)
});
