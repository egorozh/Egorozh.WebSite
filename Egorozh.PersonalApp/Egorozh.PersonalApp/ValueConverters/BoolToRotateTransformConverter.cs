using System;
using System.Globalization;
using Avalonia.Media;

namespace Egorozh.PersonalApp.ValueConverters;


public class BoolToRotateTransformConverter : BaseValueConverter<bool, ITransform>
{
    protected override ITransform? ConvertImpl(bool value, Type targetType, object? parameter, CultureInfo culture)
    {
        return new RotateTransform(value ? 0 : 90);
    }
}