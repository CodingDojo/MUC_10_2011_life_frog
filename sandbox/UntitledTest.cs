
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
    public void Complex2x2ToLife()
    {
        var result = LifeCalculator.Calc(new string[]{".*",
                                       "**"});
        Assert.AreEqual(1, result.Length);
        Assert.AreEqual("**",result[0]);
        Assert.AreEqual("**",result[0]);
    }

}

