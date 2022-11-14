using System;
using System.Collections.Generic;
using System.Linq;

namespace BluebirdPS.APIV2.Objects
{
    public class Poll : TwitterObject
    {
        public string Id { get; set; }
        public List<PollOptions> Options { get; set; }
        public long TotalVotes { get; set; }
        public long Duration { get; set; }
        public DateTime EndDateTime { get; set; }
        public string VotingStatus { get; set; }

        public Poll() { }
        public Poll(dynamic input) {
            OriginalObject = input;

            Id = input.id;
            EndDateTime = input.end_datetime;
            Duration = input.duration_minutes;
            VotingStatus = Helpers.ToTitleCase(input.voting_status);

            List<PollOptions> pollOptions = new List<PollOptions>();
            foreach (dynamic item in input.options)
            {
                PollOptions option = new PollOptions(item);
                pollOptions.Add(option);
                TotalVotes += option.Votes;
            }
            Options = pollOptions;
        }

        public override string ToString()
        {
            List<string> options = (from PollOptions option in Options
                                    select option.ToString()).ToList();

            string state = EndDateTime != null ? ", " + EndDateTime.ToString() : string.Empty;

            return $"{string.Join(", ", options)} ({VotingStatus})";
        }

    }
}