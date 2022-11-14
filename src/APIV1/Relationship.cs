namespace BluebirdPS.APIV1
{
    public class Relationship : TwitterObject
    {
        public Source Source { get; private set; }
        public Target Target { get; private set; }

        public Relationship(dynamic input)
        {
            OriginalObject = input;

            Source = new Source(input.source);
            Target = new Target(input.target);
        }

    }
}