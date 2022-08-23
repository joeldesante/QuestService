# QuestService
*The Flexible, Open Source Quest System.*
[Source Code ](https://github.com/joeldesante/QuestService) | [Download ](https://github.com/joeldesante/QuestService/releases)

IMAGE GO HERE

### What is QuestService?
QuestService is module designed to make implementing quests in your game simple and robust without making too many decisions for you.

The existing modules (that I've seen) all have the same problem in that they expect that there will be only be a limited set of parameters which need to be checked before a quest is completed. This module has no such reservations.

QuestService allows you to be very specific with how your quests are designed and is flexible enough to allow the programmer to be creative with how they use the module. For example, if you wanted there to be a multi-part quest, it wouldn't be hard to implement such a thing even though there is no logic within the module itself that explicitly supports such a feature. To do this you could easily begin another quest upon the completion of the first part an thus a multipart quest is born.

### How do I use QuestService?
Getting up and running with QuestService is simple.

> When you install the module, it's best to store it in `ServerStorage` and **NOT** in `ReplicatedStorage` as QuestService runs entirely on the server. 

1. Visit the GitHub Repository and download the module. I recommend placing it in `ServerStorage`.
2. Create a Quest simply by following this tutorial.
3. Give some player the quest.

---

### Final Notes
I hope that this module will be helpful for others who need a good way to add quests to their games. Please let me know if you have any questions or comments and I will do my best to respond in a timely manner.