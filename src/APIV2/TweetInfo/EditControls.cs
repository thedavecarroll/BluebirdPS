using System;

namespace BluebirdPS.APIV2.TweetInfo
{
    public class EditControls : TwitterObject
    {
        public bool IsEditEligible { get; set; }
        public DateTime EditableUntil { get; set; } 
        public long EditsRemaining { get; set; } 

        public EditControls() { }
        public EditControls(dynamic input)
        {
            OriginalObject = input;

            IsEditEligible = input.is_edit_eligible;
            EditableUntil = input.editable_until;
            EditsRemaining = input.edits_remaining;
        }

        public override string ToString()
        {
            return $"IsEditEligibile: {IsEditEligible}, EditableUntil: {EditableUntil}, EditsRemaining: {EditsRemaining}";
        }
    }
}
