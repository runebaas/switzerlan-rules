# osu!

## General Provisions

These rules inherit all rules from the main rulebook.

These rules apply to all participants of the osu! tournament (hereinafter "osu" or "Game").

The rules may be available in several languages. If the individual versions differ, the English version is considered the source of the truth.

## Tournament Information

### Entry Restrictions

There are no rank restrictions for LAN tournaments unless specified. Map selectors and organizers are not allowed to participate in the tournament.

### Qualifiers

#### Stage 1-3

The tournament starts with a qualifier system. The participants will play in self reffed lobbies. Upon entering the lobby the players must immediately send their match link to a tournament administrator.

All stages are FM. DT is exempt. All mods will be normalised in score.

Warmups are NOT allowed during qualifiers as they hamper the point distribution. NF is enforced at all times.

Per qualifier stage 2 cycles of each pool are granted. Each stage will have a submitting period ranging from 45 minutes to 70 and will be called out by an administrator.

Players will collect points on each map totaling up to a maximum of 3 points per map. SV2 is the effective scoring used.

Top 16 will advance to brackets.

In case of a point tie (very unlikely), the Point Break map will be played to determine the ranking order of the affected players.

#### Bracket

The tournament continues in a double elimination format. Participants who lose a match continue playing in the losers bracket. Participants who lose a match in the losers bracket will be completely eliminated from the tournament.

After both brackets have concluded, the winners of the two brackets compete in the grand finals. If the winner of the losers bracket wins, an additional match will be played. However, if the player from the winner's bracket wins, he wins the tournament.

Map pool size for each round are as follows:

| Round        | Size    |
|--------------|---------|
| Q1           | 5 maps  |
| Q2           | 7 maps  |
| Q3           | 9 maps  |
| Ro16/8, L1-2 | 12 maps |
| Ro4/2, L3-6  | 15 maps |
| Grand Finals | 16 maps |

#### Point distribution

This tournament iteration qualifier will be based around a point distribution system that works as follows:

There are 4 Categories which factor in the score you get at the end of a map. **Score** and **Combo** are **weighted 50%** as there is a strong correlation between the two.


| Category   | Weight |
|------------|--------|
| Score      | 50%    |
| Combo      | 50%    |
| Acc        | 100%   |
| Miss Count | 100%   |

Each category gives points according to the player's performance.

| Category   | Points |
|------------|--------|
| Score      | 0.5    |
| Combo      | 0.5    |
| Acc        | 1.0    |
| Miss Count | 1.0    |

The points are calculated as follows:

{{< katex display >}}
\frac{Score}{1000000 * 2} = Score Points
\\[2em]
\frac{Combo}{MaxCombo * 2} = Combo Points
\\[2em]
Acc^8 = Acc Points
\\[2em]
(\frac{objects - miscounts}{objects})^{60} = Miscount Points
{{< /katex >}}

### Match procedures

#### Lobby Creation

The players open up their own lobbies. This tournament will be fully self reffed until the Grand Finals.

#### Roll and warmups (Brackets only)

At the beginning of a match, each player executes a !roll command.

The player with the highest roll points will have their warmup played first. Warmup maps may not be longer than four minutes and may not contain questionable or offensive material of any kind. Players are free to choose mods when playing a warmup map. Bans will be in succession meaning: !roll -> warm-up -> 1 Ban -> 1 Ban -> Pick

Double banning a mod by the same player is not allowed, NM is exempt.

The roll winner may choose the ban order.

First ban will be the first pick.

#### Bans

There will be **no bans** available for the players during qualifiers.

During Ro16/8, L1-2 and Ro4/2, L3-6, players will be granted 1 ban each.

During grand finals, players will be granted 2 bans each.

#### Map Rules

Once started, the map must be played until the end. The point distribution of a map is determined by the scores submitted to the /mp/ link. A player’s score is counted as long as he does not quit during the map. If a map is played on the wrong settings e.g. wrong mod or score system, it will be replayed.

#### Lobby behaviour

Behaviour during and between matches underlies the global osu! and [switzerLAN rules](https://rules.switzerlan.ch/). Players are expected to be respectful to staff and to each other during matches. In extreme cases, the tournament management may disqualify a player for excessive disruptions and rule violations.

#### Rematches

In case a player disconnects during a map, the admins may allow a replay subject to

the following conditions:

* Bancho messed up

### Lobby Settings

#### Player vs. Player

| Setting       | Value                           |
|---------------|---------------------------------|
| Name          | CHLAN: (Player 1) vs (Player 2) |
| Game mode     | osu! std                        |
| Team mode     | Head to Head                    |
| Win condition | Score **V2**                    |

The room should be locked

**!addref Command**

#### Qualifier


| Setting       | Value                               |
|---------------|-------------------------------------|
| Name          | CHLAN: (Player 1) vs (Qualifier X*) |
| Game mode     | osu! std                            |
| Team mode     | Head to Head                        |
| Win condition | Score **V2**                        |

The room should be locked

(*corresponding Stage 1-3)
