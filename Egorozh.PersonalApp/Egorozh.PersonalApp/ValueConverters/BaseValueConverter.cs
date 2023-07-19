using System;
using System.Globalization;
using Avalonia.Data.Converters;
using Avalonia.Markup.Xaml;


namespace Egorozh.PersonalApp.ValueConverters;


public abstract class BaseValueConverter<TIn, TOut> : MarkupExtension, IValueConverter
{
    public override object ProvideValue(IServiceProvider serviceProvider) => this;


    public object? Convert(object? value, Type targetType, object? parameter, CultureInfo culture)
    {
        if (value is TIn inValue)
            return ConvertImpl(inValue, targetType, parameter, culture);

        throw new ArgumentException($"{nameof(Convert)} - value is not type: {typeof(TIn)}");
    }

    
    public object? ConvertBack(object? value, Type targetType, object? parameter, CultureInfo culture)
    {
        if (value is TOut outValue)
            return ConvertBackImpl(outValue, targetType, parameter, culture);

        throw new ArgumentException($"{nameof(ConvertBack)} - value is not type: {typeof(TOut)}");
    }


    protected abstract TOut? ConvertImpl(TIn? value, Type targetType, object? parameter, CultureInfo culture);

    
    protected virtual TIn? ConvertBackImpl(TOut? value, Type targetType, object? parameter, CultureInfo culture)
    {
        throw new NotImplementedException();
    }
}