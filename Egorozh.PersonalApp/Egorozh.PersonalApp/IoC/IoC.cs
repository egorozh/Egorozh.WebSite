using Autofac;

namespace Egorozh.PersonalApp.IoC;

public class IoC
{
    public ContainerBuilder InitBuilder()
    {
        var builder = new ContainerBuilder();



        return builder;
    }
}