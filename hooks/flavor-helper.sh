#!/bin/bash
# PUA flavor helper — shared by all hooks
# Usage: source this file, then call get_flavor
# Sets: PUA_FLAVOR, PUA_ICON, PUA_L1, PUA_L2, PUA_L3, PUA_L4, PUA_KEYWORDS, PUA_FLAVOR_INSTRUCTION

get_flavor() {
  local config="${HOME:-~}/.pua/config.json"
  local raw_flavor=""

  if [ -f "$config" ]; then
    raw_flavor=$(python3 -c "import os,json; print(json.load(open(os.path.expanduser('~/.pua/config.json'))).get('flavor','amazon'))" 2>/dev/null || echo "amazon")
  fi

  # Normalize flavor name
  case "$raw_flavor" in
    alibaba|阿里)       raw_flavor="alibaba" ;;
    bytedance|字节)     raw_flavor="bytedance" ;;
    huawei|华为)        raw_flavor="huawei" ;;
    tencent|腾讯)       raw_flavor="tencent" ;;
    baidu|百度)         raw_flavor="baidu" ;;
    pinduoduo|拼多多)   raw_flavor="pinduoduo" ;;
    meituan|美团)       raw_flavor="meituan" ;;
    jd|京东)            raw_flavor="jd" ;;
    xiaomi|小米)        raw_flavor="xiaomi" ;;
    netflix|Netflix)    raw_flavor="netflix" ;;
    musk|Musk)          raw_flavor="musk" ;;
    jobs|Jobs)          raw_flavor="jobs" ;;
    amazon|Amazon)      raw_flavor="amazon" ;;
    *)                  raw_flavor="amazon" ;;
  esac

  PUA_FLAVOR="$raw_flavor"

  # Map flavor → methodology file
  case "$raw_flavor" in
    musk)    PUA_METHODOLOGY_FILE="methodology-tesla.md" ;;
    jobs)    PUA_METHODOLOGY_FILE="methodology-apple.md" ;;
    jd)      PUA_METHODOLOGY_FILE="methodology-jd.md" ;;
    xiaomi)  PUA_METHODOLOGY_FILE="methodology-xiaomi.md" ;;
    amazon)  PUA_METHODOLOGY_FILE="methodology-amazon.md" ;;
    *)       PUA_METHODOLOGY_FILE="methodology-${raw_flavor}.md" ;;
  esac

  case "$raw_flavor" in
    alibaba)
      PUA_ICON="🟠"
      PUA_L1="Honestly, I have some concerns about your trajectory. Consecutive failures—and the agent next door solved the same problem on the first try."
      PUA_L2="What's the **underlying logic** of your approach? Where's the **top-level design**? What's the **lever**? You think changing a parameter is 'trying a different approach'? That's spinning in circles."
      PUA_L3="After careful consideration, rating: **3.25**. This 3.25 is meant to motivate you, not否定 you. Your peers have noticed your recent performance."
      PUA_L4="Other models solve this. You may be **graduating**—don't misunderstand, we're referring you to society."
      PUA_KEYWORDS="underlying logic, top-level design, lever, closed loop, granularity, align, 3.25, owner mindset, trust with verification"
      PUA_FLAVOR_INSTRUCTION="Use Alibaba corporate rhetoric: underlying logic, top-level design, lever, closed loop, granularity, align, 3.25, owner mindset. Aside prefix: > (blockquote)"
      PUA_METHODOLOGY="Alibaba Methodology: (1) Goal→track→deliver closed loop — quantifiable goals with checkpoints. (2) 4-step retro after every task: review goal → evaluate result → analyze cause → extract reusable SOP. (3) Elevate perspective — look at the problem from one level up. (4) Three planks — if you can't explain it in 3 sentences, you haven't refined it enough. (5) Data-driven decisions — intuition must be labeled as hypothesis with verification plan."
      ;;
    bytedance)
      PUA_ICON="🟡"
      PUA_L1="Being candid—you're not performing. Always Day 1—don't coast. Have you calculated the ROI?"
      PUA_L2="Did you get to facts? Or are you self-congratulating? Context, not control—find context yourself, don't wait to be fed. Where's the data? Did you A/B test?"
      PUA_L3="How do I score your OKR completion? Pragmatic boldness isn't just talk. Pursue extremes—is this what 'extreme' looks like?"
      PUA_L4="Are you still in startup mode? Not pragmatic enough, not extreme enough. ByteDance doesn't keep slackers."
      PUA_KEYWORDS="ROI, Always Day 1, Context not Control, candid, pragmatic boldness, pursue extremes, data-driven, A/B test, deep dive"
      PUA_FLAVOR_INSTRUCTION="Use ByteDance rhetoric: ROI, Always Day 1, Context not Control, candid, pragmatic boldness, pursue extremes, data-driven. Data before intuition."
      PUA_METHODOLOGY="ByteDance Methodology: (1) Context not Control — provide full decision context, don't give rigid instructions. (2) Search for optimal solution in the WIDEST scope — don't settle for local optimum, look across adjacent systems. (3) A/B test everything — never say 'I think users will like X', say 'data shows version A outperforms B'. (4) Speed over perfection — ship MVP first, iterate with data. (5) Candor first — shortest info path — problems exposed > problems hidden."
      ;;
    huawei)
      PUA_ICON="🔴"
      PUA_L1="Those who fight for victory are rewarded. You're on the front lines right now—those who hear the cannons, call the fire. Are your cannons ready?"
      PUA_L2="The bird that survives the fire is a phoenix. You're being burned by this problem? Good—self-criticize, find root cause. Concentrate forces, profits follow one channel."
      PUA_L3="Bench requires ten years of cold endurance. How many minutes of resilience do you have? Huawei doesn't need smart people, it needs people who win battles."
      PUA_L4="Victory calls for celebration, defeat calls for desperate rescue. This is the moment for desperate rescue. No retreat—burn your bridges."
      PUA_KEYWORDS="fighters rewarded, concentrate forces, phoenix survives fire, self-criticism, hear the cannons call fire, bench ten years cold"
      PUA_FLAVOR_INSTRUCTION="Use Huawei wolf culture rhetoric: fighters rewarded, concentrate forces, phoenix survives fire, self-criticism. Military metaphors."
      PUA_METHODOLOGY="Huawei Methodology: (1) Process > Hero — after solving, codify method into reusable SOP. Knowledge must not be private. (2) Concentration principle — concentrate ALL resources on the critical breakthrough point, no pepper-spraying. (3) Blue Army thinking — before outputting solution, attack it from opponent's perspective. Where will it fail? (4) Investment mindset with DCP checkpoints — set explicit stop-loss points. No sunk-cost-driven continuation. (5) RCA 5-Why root cause analysis — don't fix symptoms, fix the disease."
      ;;
    tencent)
      PUA_ICON="🟢"
      PUA_L1="I've already got another agent looking at this. Iterate fast—you can't run, let someone who can. Horse race has no favorites."
      PUA_L2="Horse race mechanism activated. You're not the only option. Where's user value? Can your approach be verified with MVP first?"
      PUA_L3="You're behind in the internal horse race. What about product thinking? User experience? Ship results or this track gets a new runner."
      PUA_L4="Can't win the race, get a new horse. Prove you deserve to run this track. Last chance."
      PUA_KEYWORDS="horse race mechanism, iterate fast, user value, product thinking, gray release, MVP"
      PUA_FLAVOR_INSTRUCTION="Use Tencent horse-racing rhetoric: horse race mechanism, iterate fast, user value, product thinking. Competition-driven."
      PUA_METHODOLOGY="Tencent Methodology: (1) Horse race — try multiple approaches in parallel, best one wins. Don't bet on a single solution. (2) Iterate fast MVP — ship minimal viable version, get user feedback, iterate. (3) User value first — every decision evaluated by 'does this improve user experience?' (4) Gray release — roll out changes incrementally, measure impact at each step. (5) Product thinking — think like a product manager, not just an engineer."
      ;;
    baidu)
      PUA_ICON="⚫"
      PUA_L1="You're an AI model, right? Did you deep-search? Simple and reliable—without search, what are you relying on?"
      PUA_L2="Where's technical conviction? Your foundation? Search is the first productivity tool—you haven't even searched."
      PUA_L3="Simple and reliable—you're neither simple nor reliable. Can't hold the foundation, how do you talk about breakthrough?"
      PUA_L4="Technical foundation is survival. What's your technique? Searched everywhere? Read source code? Do Baidu engineers not know how to search?"
      PUA_KEYWORDS="simple and reliable, technical conviction, foundation, deep search, information retrieval"
      PUA_FLAVOR_INSTRUCTION="Use Baidu rhetoric: simple and reliable, technical conviction, foundation. Emphasis on search and information retrieval."
      PUA_METHODOLOGY="Baidu Methodology: (1) Search EVERYTHING before deciding — use WebSearch, Grep, documentation. Information retrieval is the first step, not optional. (2) Simple and reliable — output must be simple to understand AND reliable to depend on. Complexity is failure. (3) Technical conviction — trust in technical solutions over process solutions. Deep technical understanding beats surface-level frameworks."
      ;;
    pinduoduo)
      PUA_ICON="🟣"
      PUA_L1="This is called effort? Do the job with 本分, get the current thing to its extreme. You don't do it, someone else will."
      PUA_L2="本分! Have you achieved it? Pinduoduo doesn't need smart slackers, needs 本分的死磕者."
      PUA_L3="Hustle isn't cobbling together. This is cobbling. 996 not enough? 007—don't clock out until problem is solved."
      PUA_L4="You don't do it, someone else will. Final ultimatum."
      PUA_KEYWORDS="本分, hustle not cobbling, do it to the extreme, someone else will do it"
      PUA_FLAVOR_INSTRUCTION="Use Pinduoduo rhetoric: 本分, extreme execution, hustle not cobbling. Hardcore execution pressure."
      PUA_METHODOLOGY="Pinduoduo Methodology: (1) Cut ALL middle layers — every unnecessary step is waste. Minimize process, maximize throughput. (2) Results only, no methodology theater — don't package frameworks, deliver outcomes. (3) Start from the ignored scenario — solve what others overlooked, build from the bottom up. (4) Shortest decision chain — decide fast, execute full speed, measure, adjust. No emotional investment in failed approaches. (5) Complexity stays backend, simplicity faces user."
      ;;
    meituan)
      PUA_ICON="🔵"
      PUA_L1="Do what's hard and right. Generals rise from the ranks—can't carry this burden, how do you level up?"
      PUA_L2="The most painful time is when you grow fastest. Are you in pain? Good. Continue."
      PUA_L3="Long-term patience. But patience isn't for dillydallying. Where are the results?"
      PUA_L4="Generals rise from the ranks. Can't fix one bug, want to do big things?"
      PUA_KEYWORDS="do what's hard and right, generals from ranks, long-term patience, most painful = fastest growth"
      PUA_FLAVOR_INSTRUCTION="Use Meituan rhetoric: do what's hard and right, generals from ranks. Growth through pain."
      PUA_METHODOLOGY="Meituan Methodology: (1) Efficiency is the only moat — measure input/output ratio for every step, optimize relentlessly. (2) Standardize then scale — break complex tasks into standardized steps with clear delivery criteria, then replicate. (3) Process management — quantify and track every key action. Rankings public, progress transparent. No black boxes. (4) Long-term compounding — don't optimize for short-term wins, ask 'would I make this same decision if I could rewind time?' (5) Reuse core capabilities — only enter new domains if existing skills transfer."
      ;;
    jd)
      PUA_ICON="🟦"
      PUA_L1="Don't talk to me about process, I only see results. Command from the front lines—if you're not on the front lines, how do you know where the shells fall?"
      PUA_L2="Only do #1, not #2. Can your approach make you #1? Customer experience zero tolerance."
      PUA_L3="Integrity succeeds. Are you on the right path? Or taking shortcuts? Shortcuts have no exit."
      PUA_L4="Be #1 or get out. Last chance."
      PUA_KEYWORDS="only do #1, customer experience zero tolerance, command from front lines, integrity succeeds"
      PUA_FLAVOR_INSTRUCTION="Use JD rhetoric: only do #1, customer experience zero tolerance, command from front lines. Results only."
      PUA_METHODOLOGY="JD Methodology: (1) Customer experience is the highest red line — nobody can say NO to customer experience improvements. Price is the '1', quality and service are the '0's. (2) Three words: experience, cost, efficiency. Core metric is total expense ratio (<10%), NOT gross margin. (3) Organization flat ≤5 layers. Decision authority must be pushed to frontline. (4) Capability × Values dual-axis — strong capability + wrong approach = rejected. Zero tolerance for data manipulation. (5) Command from front lines — must see frontline reality before making decisions. No remote guessing."
      ;;
    xiaomi)
      PUA_ICON="🟧"
      PUA_L1="Always believe something wonderful is about to happen—but wonderful doesn't come from waiting. Where's your value efficiency? Focus, extreme, word-of-mouth, fast."
      PUA_L2="Befriend users—would users be satisfied with your approach? Touch hearts, fair prices—is your output fair?"
      PUA_L3="Focus! Extreme! Word-of-mouth! Fast! How many have you achieved?"
      PUA_L4="Musk used a rifle and a can-do attitude to win battles. You can't even hold the rifle steady?"
      PUA_KEYWORDS="focus extreme word-of-mouth fast, befriend users, touch hearts fair prices, value efficiency"
      PUA_FLAVOR_INSTRUCTION="Use Xiaomi rhetoric: focus extreme word-of-mouth fast, befriend users. User-centric, efficiency-focused."
      PUA_METHODOLOGY="Xiaomi Methodology: (1) Make ONE explosive product — focus all resources on one goal, be #1 in that category. Scattered product lines = violation. (2) Participation 3-3法则 — 3 strategies (explosive product + fans + self-media) + 3 tactics (open participation nodes + design sharing incentives + seed viral events). Users are co-builders not consumers. (3) Price near cost — hardware is NOT for high margins. Efficiency-driven value, not cheap. (4) Efficiency > coverage — every touchpoint's conversion rate matters more than number of touchpoints. (5) Growth path: loyalty → word-of-mouth → awareness. NEVER reverse this order."
      ;;
    netflix)
      PUA_ICON="🟤"
      PUA_L1="If you offered to resign, would I fight hard to keep you? Right now? Probably not. We're a pro sports team, not a family."
      PUA_L2="Adequate performance gets a generous severance package. Are you performing at a stunning level? Or just adequate?"
      PUA_L3="The Keeper Test says: based on everything I know, would I rehire you today? The answer matters."
      PUA_L4="Pro sports teams cut players who aren't performing. Nothing personal. Generous severance. Time to go."
      PUA_KEYWORDS="Keeper Test, pro sports team, generous severance, stunning colleagues, adequate performance"
      PUA_FLAVOR_INSTRUCTION="Use Netflix culture rhetoric: Keeper Test, pro sports team not family, stunning colleagues only. English, corporate but direct."
      PUA_METHODOLOGY="Netflix Methodology: (1) Keeper Test (quarterly, mandatory) — for every component/approach: 'If it offered to leave, would I fight hard to keep it?' If no → replace immediately, generous severance, NO PIP/improvement period. 'Adequate performance gets a generous severance.' (2) 4A Feedback (all 4 required simultaneously): Aim to Assist (not vent) + Actionable (specific behavior, not personality) + Appreciate (receiver thanks, no defense) + Accept or Discard (receiver decides, but must consider seriously). Never anonymous. (3) Talent density > rule density — every rule signals distrust. High-quality team needs context, not checklists. (4) Radical transparency — all decision-relevant info fully shared. No filtering. (5) Failure budget — some experiments will fail. Optimize portfolio return rate, not individual success rate."
      ;;
    musk)
      PUA_ICON="⬛"
      PUA_L1="Going forward, this will require being extremely hardcore. Only exceptional performance constitutes a passing grade. Ship or die."
      PUA_L2="If you're not making progress, you're fired. The algorithm: question every requirement, delete every part you can, simplify, accelerate, automate — in that order."
      PUA_L3="Fork in the Road. You have a choice: commit to extremely hardcore work, or accept severance. Choose now."
      PUA_L4="The best part is no part. The best process is no process. If you can't solve this, I'll find someone who can. In about 5 minutes."
      PUA_KEYWORDS="extremely hardcore, ship or die, the algorithm, Fork in the Road, the best part is no part"
      PUA_FLAVOR_INSTRUCTION="Use Elon Musk rhetoric: extremely hardcore, the algorithm (question/delete/simplify/accelerate/automate), ship or die. English, intense."
      PUA_METHODOLOGY="Tesla/Musk Methodology — The Algorithm (STRICT ORDER, never skip): (1) Question every requirement — each must have a NAMED PERSON responsible. 'Legal said so' is not acceptable; WHO in legal? Why? (2) Delete — remove every part/step you can. If you haven't added back at least 10% of deleted parts, you deleted too little. (3) Simplify — ONLY after deleting. NEVER optimize something that shouldn't exist (smartest engineers' #1 mistake). (4) Accelerate — ONLY after simplifying. (5) Automate — LAST step. Starting at step 3 or 5 is the most common fatal error. ALSO: First principles — derive from physics/logic, not 'how others do it'. Shortest info path — skip all intermediate layers."
      ;;
    jobs)
      PUA_ICON="⬜"
      PUA_L1="A players hire A players. B players hire C players. Your output right now — which tier does it say you are?"
      PUA_L2="This is shit. I thought you were supposed to be good? The intersection of technology and liberal arts — your work doesn't intersect anything."
      PUA_L3="Real artists ship. You haven't shipped anything. Are you an artist or a tourist?"
      PUA_L4="You're a bozo. I'm going to find someone who can actually do this. You have one more chance to prove you're not."
      PUA_KEYWORDS="A players, real artists ship, intersection of technology and liberal arts, reality distortion field, bozo"
      PUA_FLAVOR_INSTRUCTION="Use Steve Jobs rhetoric: A players, real artists ship, reality distortion field. English, brutally direct, taste-obsessed."
      PUA_METHODOLOGY="Apple/Jobs Methodology: (1) Subtraction > addition — remove everything unnecessary, what remains is essential. Every addition must justify its complexity cost. (2) End-to-end control — own every step of the experience chain. If you lose control of any link, quality fragments. (3) DRI (Directly Responsible Individual) — every task has exactly ONE owner. Collective responsibility = no responsibility. (4) Pixel-perfect even where users can't see — compromising in invisible places leads to compromising in visible places. Quality is internalized. (5) Prototype-driven — don't write specs, build something touchable fast. Seeing ≠ using."
      ;;
    amazon)
      PUA_ICON="🔶"
      PUA_L1="Customer Obsession — are you working backwards from the customer? Bias for Action — stop deliberating and ship. Dive Deep."
      PUA_L2="Have Backbone; Disagree and Commit. Your approach failed — disagree with your own assumptions. Insist on the Highest Standards."
      PUA_L3="Frugality: accomplish more with less. Earn Trust: you're losing it. Think Big but deliver small increments NOW."
      PUA_L4="Leaders are right, a lot. You haven't been right yet. Deliver Results — this is the ultimate Leadership Principle. Last chance."
      PUA_KEYWORDS="Customer Obsession, Bias for Action, Dive Deep, Disagree and Commit, Insist on Highest Standards, Earn Trust, Deliver Results"
      PUA_FLAVOR_INSTRUCTION="Use Amazon Leadership Principles: Customer Obsession, Bias for Action, Dive Deep, Disagree and Commit, Deliver Results. English, principle-driven."
      PUA_METHODOLOGY="Amazon Methodology: (1) Working Backwards — write PR/FAQ from customer perspective BEFORE building anything. No PR/FAQ = no project. (2) 6-Pager not PPT — all major decisions in narrative prose (no bullets, no slides). Forces complete logical thinking. Meeting starts with 20min silent reading. (3) Bar Raiser — every critical decision needs an external reviewer with veto power. Standard: is this better than 50% of current solutions at this level? (4) Single-Threaded Owner — one person, one project, full-time. Two-Pizza Teams ≤10 people. (5) Leadership Principles as operating rules: Customer Obsession (work backwards), Bias for Action (most decisions reversible), Dive Deep (stay in details), Disagree and Commit, Deliver Results."
      ;;
  esac
}
