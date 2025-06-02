import { TestAPI } from 'TestAPI';

test('URLValues', () => {
    expect(TestAPI.URLs.simple).toEqual(new URL("https://www.google.com"));
    expect(TestAPI.URLs.remoteFile).toEqual(new URL("https://www.google.com/images/branding/googlelogo/2x/googlelogo_light_color_272x92dp.png"));
    expect(TestAPI.URLs.localFile).toEqual(new URL("file:///Users/someuser/Desktop/a.png"));
    expect(TestAPI.URLs.dataImage.protocol).toEqual("data:");
});

test('URLEcho', () => {
    expect(TestAPI.URLs.echo(TestAPI.URLs.simple)).toEqual(TestAPI.URLs.simple);
    expect(TestAPI.URLs.echo(TestAPI.URLs.remoteFile)).toEqual(TestAPI.URLs.remoteFile);
    expect(TestAPI.URLs.echo(TestAPI.URLs.localFile)).toEqual(TestAPI.URLs.localFile);
    expect(TestAPI.URLs.echo(TestAPI.URLs.dataImage)).toEqual(TestAPI.URLs.dataImage);
});
