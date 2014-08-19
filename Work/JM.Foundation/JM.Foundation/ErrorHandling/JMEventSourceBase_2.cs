using System.Threading;

namespace JM.Foundation.ErrorHandling
{
    public abstract class JMEventSourceBase<T> : JMEventSourceBase where T : JMEventSourceBase<T>, new()
    {
        protected static T s_instance;

        public static new T Log
        {
            get
            {
                LazyInitializer.EnsureInitialized<T>(
                ref JMEventSourceBase<T>.s_instance,
                () => new T());

                return JMEventSourceBase<T>.s_instance;
            }
        }

        public void Initialize()
        {
            JMEventSourceBase.s_baseInstance = JMEventSourceBase<T>.Log;
        }
    }
}