using System;
using System.Management.Automation;
using System.Reflection;

namespace BluebirdPS
{
    public class ValidateObjectNotNullOrEmptyAttribute : ValidateArgumentsAttribute
    {
        protected override void Validate(object validationObject, EngineIntrinsics engineIntrinsics)
        {
            Type objectType = validationObject.GetType();

            ConstructorInfo emptyConstructor = objectType.GetConstructor(Type.EmptyTypes);
            if (emptyConstructor == null)
            {
                // the object type does not have an parameterless constructor
                return;
            }

            string param;
            switch (objectType.Name)
            {
                case "TwitterRequest":
                    if (objectType.GetProperty("Endpoint").GetValue(validationObject, null) != null) {
                        return;
                    }
                    else
                    {
                        param = "Endpoint";
                    }
                    break;
                default:
                    if (objectType.GetProperty("Id").GetValue(validationObject, null) != null)
                    {
                        return;
                    }
                    else
                    {
                        param = "Id";
                    }
                    break;
            }

            throw new ArgumentNullException(objectType.Name, $"Object must have a value for {param}");
        }
    }
}
