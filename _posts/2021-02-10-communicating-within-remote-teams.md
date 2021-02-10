---
title: Communicating within remote teams
author: Emmanuel Bernard
tags: [ "communication" ]
header:
  teaser: /images/blog/communication.jpg
---
Communicating in a remote team has some specific challenges.
Working remotely has lots of benefits but can be stressful due to the non physical lines between work and personal life.
I've been thinking a lot about team communications over the years in the context of open source communities.
Open Source communities are by nature remote, timezone hopeless and trusting in nature.
Remote work and leadership trust in people is essential for success in my opinion.

Anyways, here is a partial set of communication guidelines I try to adhere to and the reasons for them.

## Context

[COVID-19](https://en.wikipedia.org/wiki/COVID-19_pandemic) has put a lot of people into a remote working environment instantly.
This is hard as an individual to adjust to this level.
When an entire team is forced to move in this model, this will create massive chaos.
One key element is how to balance the need for communication with the right to disconnect.

I'm in an environment where the team is big, enough that it's a team of teams achieving a goal.
I also happen to work in a global company or on communities that have no timezone boundaries.
In this context, any synchronous communication is bringing cost (organisational challenge, info catch up delays, respect of down time etc).

I am also quite sensitive to the permanence of communication.
Having to repeat n times the same things is just inefficient and lossy.
Being able to talk to your past self (or past self as a team in this case) is quite invaluable.

## Approach

### Some granularity but not atomicity

We need a hierarchical (for scalability) way to communicate important information to the right group level (golbal, specific group or or subgroup).
For that, there will be a global level channel, team level channels and some will be virtual team level channels.
Try and target the right group.
I'm personally erring on the side of overreaching but don't abuse it.

You could and can email one or a select group of ad-hoc persons.
However, a thread of a small set of people has an organic way of getting more people added who miss half the context.
In the end, the optimisation you used by reducing communication flow is lost in the overhead of catching up with the right folks and the frustration of "not having been made aware".

### Use emails and not some instant message communication tool (Slack etc)

The mechanism needs to be asynchronous for anyone to have a chance to catch up.
By asynchronous, I mean that there is an expectation that answers will take some time and come when the answering person is best ready to process that.
It also needs to be _costly_ enough that it will be an effort to initiate communication: a rule of thumb is when you prefer to ask the channel before searching yourself first, something is rotten.
Communication is good, chatter is not (at least it can be but for social activities).

Instant messaging platforms like Slack are popular amongst people.
I will take a controversial stance: I don't like this type of tools.
There is nothing fundamentally wrong with them except that there is some design decisions that confuse the purpose of the tool leading to bad misuse:

* you can do instant communication almost like a conversation (the famous `typing...` feedback that freezes us to stare at it (at least I do). When people don't reply instantly, you are *angry* at them – you should not, you just did put expectations into this tool
* the threading model for most of these tools is really bad, so people tend to interweave conversations making them hard to follow, especially a few hours later. You can see it even in Slack where it is actively harder to initiate a thread vs create a new top level message. It really should be the opposite!
* it is too easy to write (my cost hypothesis), so people have instant conversations vs writing down the output of their (hard labored) thought process. Imagine a collegue coming back the next day or reading the conversation in a different timezone, the mix of valuable info and babbling and twists is just exhausting to follow and very slow.
* people consider Slack a collective decision channel, they are excluding people and adding a sense of pressure of always catching up on messages. You cannot imagine how stressful that is. You have nx more Slack messages than you have emails (because of the low cost).
* speaking of stressful, how many of you stared at a slack notification over the week end in dread not wanting to look at it but being reminded of your work? That might just be me being weird, but surely you did open some slack notifications over the weekend "just in case" and it did ruin your week end.

Funny enough, because emails are threaded, a bit costly and the notification system somewhat better understood, it is a better communication channel for collective decisions.

Use instant communication platforms for what they are: UDP style multicast instant communication that will not be read by 50%+ of the people in the group (too many channels, too different time zones, awkward notifications, bad UI, too much stress to stay afloat etc).
So always capture the relevant outcome to the mailing list (or a doc).
Permanent searchable records are our TCP.

I do use instant messages but mostly for one to one conversations and always with the understanding that it might not be read.
Just like popping up at someone's desk in the old days.
This is a super important social contract your team needs to agree on collectively.

### Communicate beginning of and conclusion of key conversations to wide channels

Important decision kick off should be announced at the appropriate level in the mailing list so anyone can participate.
Decisions made should be logged on the same mailing list (or a link to it) with the quick set of reasons for that choice.
This offers a "last chance" option for people that could not participate (though use with extreme caution – velocity is not to be sacrificed) but more importantly, as many people as necessary can be aware of these important decisions in a concise fashion.
Decision making can be done as shared document, JIRA conversations, sub email conversations.

This is key because it offers the right notification hook for people to be involved into what they think in important for them and simply ignore the rest.
And they get that notification when they are ready to process it (i.e. when they read their email).

### Conversations using (virtual) meetings?

Meetings are also a mechanism to progress conversation but for *every meeting*, make sure to capture the decisions in writing vs just “considering it done”.
Consider that everyone will wipe their memory after the meeting, anything not written does not exist.

Meeting video recordings are just a trap: no one should be required to watch a meeting after the fact unless it wants more details than the summary provided.
I recommend every meeting has a note taker so action items or decisions can be logged and distilled out to the mailing list.
[No meeting is awesome](https://emmanuelbernard.com/blog/2010/05/04/no-meeting-always-beats-meeting/) (I have ideas / techniques to improve meetings requiring feedback but that's for another day).
There are some key exceptions where meeting are really a good tool:

* For manager/mentor - managee/mentee conversations or for any situation where building the human link is a factor, video calls will just do wonders to clarify the intent of each person and move forward with no disconnection. It's not as good as a drink in a bar but we are where we are.
* After a conversation has staled in a document or email thread, using a high fidelity medium like video helps reach conclusion or reset the expectation.
* There are some general formats like ask me anything or key department wide decision communications that are better done with the high fidelity video even though it consumes a lot of people's time.

My preferred model is to have some thinking process happen asynchronously before triggering a meeting, this leads to a much more productive meeting.

I do many one on one calls on specific topics to clarify intents with people.
These are fine as everyone is 100% focused on that objective.
It reasonably often lead to an email to a wider group as outcome because if one person needed clarification, chances are others do.

### Write searchable documents

I don't care if your platform is a wiki or Google Docs or what but any platform that helps share collectively writable documents and allow comments is really good to progress on a design or on goals.
First off, it forces the initator to think things through vs throw a random email or worse a random instant message.
Second, it lets others read the document at their own pace and offer options.
By remaining structured, it will remain more naturally a knowledge based style output (an email thread has too many possible twists and turns).
Third, it's searchable (or is supposed to) and if it's not, it's easier to point people to a doc than rewriting the same answer over and over.
Each of these answer can be improved collectively over time.
Emails and instant communication platforms don't offer that.
Meetings don't offer that either: one person impose a rhythm to the many.
If it were software it would be a really bad architecture and you would not do it.

You can see that you could achieve some of the same goals by email but again the cost structure is not adequate for the task of collecting a record for posterity.

I won't chastise you if you don't follow the rules, these are guidelines.
Just remember why the guidelines are here: distributing knowledge, efficient communication, avoiding the creation of [SPOF](https://en.wikipedia.org/wiki/Single_point_of_failure) persons, reduce the friction to go from noob to expert in areas, capture decisions (and their reasons, their why) so we can change them, break them, nuke them as needed with adequate context.

## What benefits are expected?
There are benefits by design and some by side effect.

1. Scalability: people can read as much as they want but can purposely ignore subjects. There is no blind spot.
2. Permanence: is is so useful to be able to come back to a document n months later and understand the decision and its context. It is also so useful to onboard people when things are written down. Or bring more people to the conversation.
3. Openness / transparency: this method forces conversations to happen in the open and I believe leads to better decisions (assuming the leadership does not wait for perfect consensus). I did not mention open source much in this post, but that model allows to scale to community wide conversations
4. Respect people's time: no one is forced to join meetings at odd hours, no one is forced to catch up on tons of instant communication conversation, people can decide at which pace they consume the information given to them. Oh and that means less meetings.
4. Thinking it through before communicating. It is becoming a lost art becase tools have a lower cost than thinking through.
