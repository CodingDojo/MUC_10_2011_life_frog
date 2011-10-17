
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

    [Test]
    public void Complex3x3ToDead()
    {
        var result = LifeCalculator.Calc(new string[]{ "***",
                                                       "***",
                                                       "***"});
        Assert.AreEqual(3, result.Length);
        Assert.AreEqual("*.*",result[0], "First Row failed.");
        Assert.AreEqual("...",result[1], "Second Row failed.");
        Assert.AreEqual("*.*",result[2], "Third Row failed.");
    }

    [Test]
    public void Empty()
    {
        var result = LifeCalculator.Calc(new string[]{ });
        Assert.AreEqual(0, result.Length);
    }

    [Test]
    public void EmptyRow()
    {
        var result = LifeCalculator.Calc(new string[]{"",""});
        Assert.AreEqual(2, result.Length);
        Assert.AreEqual("", result[0]);
        Assert.AreEqual("", result[1]);
    }

    [Test]
    public void Error1()
    {
        try
        {
            var result = LifeCalculator.Calc(new string[]{"*",""});
            Assert.Fail("Should throw argument exception");
        }
        catch(ArgumentException)
        {
        }
        catch
        {
            Assert.Fail("Should throw argument exception");
        }
    }

}

