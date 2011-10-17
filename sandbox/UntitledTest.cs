
using NUnit.Framework;

[TestFixture]
public class UntitledTest
{
    [Test]
    public void Simple()
    {
        var result = LifeCalculator.Calc(new string[]{"."});
        Assert.AreEqual(1, result.Length);
        Assert.AreEqual(".",result[0]);
    }

    [Test]
    public void Simple3x1ToLife()
    {
        var result = LifeCalculator.Calc(new string[]{"***"});
        Assert.AreEqual(1, result.Length);
        Assert.AreEqual(".*.",result[0]);
    }

    [Test]
    public void Simple3x1ToDead()
    {
        var result = LifeCalculator.Calc(new string[]{".*."});
        Assert.AreEqual(1, result.Length);
        Assert.AreEqual("...",result[0]);
    }

    [Test]
    public void Complex1x3ToLife()
    {
        var result = LifeCalculator.Calc(new string[]{  "*",
                                                        "*",
                                                        "*"});
        Assert.AreEqual(3, result.Length);
        Assert.AreEqual(".",result[0]);
        Assert.AreEqual("*",result[1]);
        Assert.AreEqual(".",result[2]);
    }

    [Test]
    public void Complex2x2ToLife()
    {
        var result = LifeCalculator.Calc(new string[]{ ".*",
                                                       "**"});
        Assert.AreEqual(2, result.Length);
        Assert.AreEqual("**",result[0], "First Row failed.");
        Assert.AreEqual("**",result[1], "Second Row failed.");
    }

[Test]
    public void Complex2x2ToLife2()
    {
        var result = LifeCalculator.Calc(new string[]{ "**",
                                                       "*."});
        Assert.AreEqual(2, result.Length);
        Assert.AreEqual("**",result[0], "First Row failed.");
        Assert.AreEqual("**",result[1], "Second Row failed.");
    }


}

