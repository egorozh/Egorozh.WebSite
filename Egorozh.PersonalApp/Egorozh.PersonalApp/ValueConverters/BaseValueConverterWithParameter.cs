using System;
using System.Globalization;


namespace Egorozh.PersonalApp.ValueConverters;


public abstract class BaseValueConverterWithParameter<TIn, TOut, TParameter> : BaseValueConverter<TIn, TOut>
{
    public override object ProvideValue(IServiceProvider serviceProvider) => this;


    protected override TOut? ConvertImpl(TIn? value, Type targetType, object? parameter, CultureInfo culture)
    {
        if (parameter is TParameter inParam)
            return ConvertImpl(value, targetType, inParam, culture);
        
        throw new ArgumentException($"{nameof(Convert)} - value is not type: {typeof(TParameter)}");
    }

    
    protected override TIn? ConvertBackImpl(TOut? value, Type targetType, object? parameter, CultureInfo culture)
    {
        if (parameter is TParameter inParam)
            return ConvertBackImpl(value, targetType, inParam, culture);

        throw new ArgumentException($"{nameof(ConvertBack)} - value is not type: {typeof(TParameter)}");
    }


    protected abstract TOut? ConvertImpl(TIn? value, Type targetType, TParameter? parameter, CultureInfo culture);

    
    protected virtual TIn? ConvertBackImpl(TOut? value, Type targetType, TParameter? parameter, CultureInfo culture)
    {
        throw new NotImplementedException();
    }
}