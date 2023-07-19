using System;
using System.Globalization;


namespace Egorozh.PersonalApp.ValueConverters;


public class BoolToWidthConverter : BaseValueConverterWithParameter<bool, double, double>
{
    protected override double ConvertImpl(bool value, Type targetType, double parameter, CultureInfo culture)
    {
        throw new NotImplementedException();
    }
}