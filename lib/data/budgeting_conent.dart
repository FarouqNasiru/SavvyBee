import '../models/content_models.dart';

class BudgetingContent {
  static const Map<String, StageContent> content = {
    // BUDGETING CONTENT - All Levels
    'Stage 1_Level 0_Budgeting': StageContent(
      cardTexts: [
        'A budget is a money plan that tracks income, spending, and saving.',
        'It helps you avoid overspending and stay in control of your finances.',
        'Your budget shows how much money is coming in (income) and going out (expenses).',
        'Budgeting helps you reach financial goals.',
        'Anyone can use a budget—even if they don\'t earn much.',
      ],
      readingSections: [
        ContentSection(type: 'title', text: 'What is a Budget?'),
        ContentSection(
            type: 'paragraph',
            text:
                'A budget is a plan that helps you manage your money. It shows how much money you earn, how much you spend, and how much you want to save. Budgets help you make sure you\'re not spending more than you have. With a good budget, you can reach your goals—like buying something special, paying bills, or saving for the future.'),
        ContentSection(
            type: 'paragraph',
            text:
                'When you make a budget, you list your income (money coming in) and your expenses (money going out). Expenses include things like food, transport, clothes, and fun activities. By writing these down, you can see where your money is going.'),
        ContentSection(
            type: 'paragraph',
            text:
                'Budgeting also helps you make better decisions. Instead of spending on things you don\'t need, you can focus on what\'s important. Even if you don\'t earn a lot, having a budget can help you use your money wisely.'),
        ContentSection(type: 'subtitle', text: 'Highlights (Key Points)'),
        ContentSection(type: 'list', items: [
          'A budget is a money plan that tracks income, spending, and saving.',
          'It helps you avoid overspending and stay in control of your finances.',
          'Your budget shows how much money is coming in (income) and going out (expenses).',
          'Budgeting helps you reach financial goals.',
          'Anyone can use a budget—even if they don\'t earn much.',
        ]),
      ],
    ),

    'Stage 2_Level 0_Budgeting': StageContent(
      cardTexts: [
        'A budget helps you plan how to use your money.',
        'Start by writing down your income and expenses.',
        'Divide your money into categories like spending, saving, and giving.',
        'Make sure your expenses do not exceed your income.',
        'Review your budget often and adjust if needed.',
      ],
      readingSections: [
        ContentSection(type: 'title', text: 'Creating Your First Budget'),
        ContentSection(
            type: 'paragraph',
            text:
                'Creating your first budget is like making a plan for how you want to use your money. It helps you avoid running out of money and shows you where your money goes.'),
        ContentSection(
            type: 'paragraph',
            text:
                'To start, list all the money you receive (your income). This could be allowance, money from work, or gifts. Next, list your expenses—things you spend money on—like transport, snacks, data, and clothes.'),
        ContentSection(
            type: 'paragraph',
            text:
                'Then, divide your income into parts:\n• What will you spend?\n• What will you save?\n• What will you give (if any)?'),
        ContentSection(
            type: 'paragraph',
            text:
                'Your goal is to make sure your expenses are not more than your income. If you spend less than you earn, you can save the rest for something important.'),
        ContentSection(type: 'subtitle', text: 'Highlights (Key Points)'),
        ContentSection(type: 'list', items: [
          'A budget helps you plan how to use your money.',
          'Start by writing down your income and expenses.',
          'Divide your money into categories like spending, saving, and giving.',
          'Make sure your expenses do not exceed your income.',
          'Review your budget often and adjust if needed.',
        ]),
      ],
    ),

    'Stage 3_Level 0_Budgeting': StageContent(
      cardTexts: [
        'Expenses are money you spend on goods and services.',
        'There are two types of expenses: needs and wants.',
        'Needs are essential; wants are optional.',
        'Tracking expenses helps you manage your budget better.',
        'Cutting down on wants can help you save more.',
      ],
      readingSections: [
        ContentSection(type: 'title', text: 'Understanding Expenses'),
        ContentSection(
            type: 'paragraph',
            text:
                'Expenses are the things you spend money on. Any time you use money to buy something or pay for a service, that\'s an expense. For example, buying food, paying for transport, buying data, or paying school fees—these are all expenses.'),
        ContentSection(
            type: 'paragraph',
            text:
                'There are two main types of expenses:\n• Needs: These are things you must pay for, like food, shelter, transport, and basic clothes.\n• Wants: These are things you like to have but can live without, like new shoes you don\'t need, snacks every day, or subscriptions.'),
        ContentSection(
            type: 'paragraph',
            text:
                'Understanding your expenses helps you make better decisions with your money. If you know where your money is going, you can reduce unnecessary spending and save more.'),
        ContentSection(type: 'subtitle', text: 'Highlights (Key Points)'),
        ContentSection(type: 'list', items: [
          'Expenses are money you spend on goods and services.',
          'There are two types of expenses: needs and wants.',
          'Needs are essential; wants are optional.',
          'Tracking expenses helps you manage your budget better.',
          'Cutting down on wants can help you save more.',
        ]),
      ],
    ),
    'Stage 4_Level 0_Budgeting': StageContent(
      cardTexts: [
        'The 50/30/20 rule is a money management guideline for budgeting your income.',
        '50% goes to needs (essential expenses).',
        '30% goes to wants (non-essential spending).',
        '20% goes to savings or paying off debts.',
        'It helps you control spending and build better financial habits.',
      ],
      readingSections: [
        ContentSection(type: 'title', text: 'The 50/30/20 Rule'),
        ContentSection(
            type: 'paragraph',
            text:
                'The 50/30/20 rule is a simple way to divide your money when making a budget. It helps you decide how much to spend on different parts of your life. This rule works by breaking your income into three parts:'),
        ContentSection(type: 'list', items: [
          '50% for Needs – These are things you must pay for, like rent, food, electricity, transport, and school fees.',
          '30% for Wants – These are things you enjoy but can live without, like eating out, entertainment, fashion, or subscriptions.',
          '20% for Savings and Debt Repayment – This part goes into your savings or is used to pay off loans and debts.',
        ]),
        ContentSection(
            type: 'paragraph',
            text:
                'By using this rule, you make sure your most important expenses are covered, you enjoy your money in moderation, and you prepare for the future.'),
        ContentSection(type: 'subtitle', text: 'Highlights (Key Points)'),
        ContentSection(type: 'list', items: [
          'The 50/30/20 rule is a money management guideline for budgeting your income.',
          '50% goes to needs (essential expenses).',
          '30% goes to wants (non-essential spending).',
          '20% goes to savings or paying off debts.',
          'It helps you control spending and build better financial habits.',
        ]),
      ],
    ),
    'Stage 5_Level 0_Budgeting': StageContent(
      cardTexts: [
        'A budget is a money plan that includes income, expenses, and savings.',
        'Expenses are divided into needs and wants.',
        'Your income should be more than or equal to your expenses.',
        'The 50/30/20 rule helps divide your money:\n• 50% to needs\n• 30% to wants\n• 20% to savings/debt',
        'Creating a budget helps you control spending and reach financial goals.',
      ],
      readingSections: [
        ContentSection(
            type: 'title',
            text: 'Budgeting Basics – Your First Step to Smart Money Habits'),
        ContentSection(
            type: 'paragraph',
            text:
                'A budget is a plan for how you use your money. It helps you understand how much money you receive (income) and how much you spend (expenses). When you create a budget, you\'re deciding in advance how your money will be used so you don\'t run out or waste it.'),
        ContentSection(
            type: 'paragraph',
            text:
                'Expenses are the things you spend money on. These can be needs—things you must pay for like food and transport—or wants, which are nice to have but not essential, like snacks or new clothes.'),
        ContentSection(
            type: 'paragraph',
            text:
                'One popular way to create a budget is the 50/30/20 rule:\n• 50% for Needs – such as rent, food, and electricity\n• 30% for Wants – like fun, entertainment, and extras\n• 20% for Savings or Debt Repayment – for future goals or paying off loans'),
        ContentSection(
            type: 'paragraph',
            text:
                'Creating your first budget starts with writing down your income and expenses, dividing them into these categories, and making sure your expenses do not go over your income. Budgeting helps you track your money, make smart choices, and save for the future.'),
        ContentSection(type: 'subtitle', text: 'Highlights (Key Points)'),
        ContentSection(type: 'list', items: [
          'A budget is a money plan that includes income, expenses, and savings.',
          'Expenses are divided into needs and wants.',
          'Your income should be more than or equal to your expenses.',
          'The 50/30/20 rule helps divide your money:\n• 50% to needs\n• 30% to wants\n• 20% to savings/debt',
          'Creating a budget helps you control spending and reach financial goals.',
        ]),
      ],
    ),

    'Stage 1_Level 1_Budgeting': StageContent(
      cardTexts: [
        'Know Where Your Money Goes – Track income and expenses.',
        'Avoid Overspending – Keep finances under control',
        'Spot Spending Patterns – Identify areas to save.',
        'Make Budgeting Easier – Plan your finances effectively.',
        'Achieve Savings Goals – Set aside money for future needs.',
        'Simple Tracking Methods – Use a notebook, app, receipts, or a spreadsheet.'
      ],
      readingSections: [
        ContentSection(type: 'title', text: 'Tracking Your Money'),
        ContentSection(
            type: 'paragraph',
            text:
                'Tracking your money helps you stay in control of your finances. It shows where your money comes from and where it goes, helping you make smarter decisions.'),
        ContentSection(type: 'subtitle', text: 'Why is Tracking Important?'),
        ContentSection(
            type: 'dropdown',
            header: 'Keeps You in Control',
            body: 'Helps you avoid overspending'),
        ContentSection(
            type: 'dropdown',
            header: 'Reveals Spending Habits',
            body: 'Shows where you can cut back.'),
        ContentSection(
            type: 'dropdown',
            header: 'Ensures Your Needs Are Covered',
            body: 'Prevents running out of money.'),
        ContentSection(
            type: 'dropdown',
            header: 'Make Budgeting Easier',
            body: 'Helps you create a plan that works.'),
        ContentSection(
            type: 'dropdown',
            header: 'Supports Savings Goals',
            body: 'Helps you save for things you want.'),
        ContentSection(type: 'subtitle', text: 'How to Track Your Money:'),
        ContentSection(type: 'list', items: [
          'Write it down in a notebook.',
          'Use an app or spreadsheet.',
          'Keep and review receipts.',
          'Check your spending weekly.'
        ]),
        ContentSection(
            type: 'paragraph',
            text:
                'Fun Fact: People who track their money are more likely to reach their financial goals!'),
      ],
    ),

    'Stage 2_Level 1_Budgeting': // Stage 2 - Level 1 (Quiz 2)
        StageContent(
      cardTexts: [
        'Prevents mistakes and tracks spending',
        'Avoids overspending with real-time updates',
        'Recording Methods: Notebook, Apps, Spreadsheets, Envelope System',
        'Best Practices: Record instantly, save receipts, review regularly',
      ],
      readingSections: [
        ContentSection(
            type: 'title', text: 'Recording Transactions Accurately'),
        ContentSection(
            type: 'paragraph',
            text:
                'Tracking your money helps prevent errors, manage your budget, and avoid overspending. Recording transactions immediately ensures accuracy and keeps your finances organized.'),
        ContentSection(type: 'subtitle', text: 'Why It\'s Important:'),
        ContentSection(
            type: 'dropdown',
            header: 'Prevents Mistakes',
            body: 'Avoid forgotten expenses and errors.'),
        ContentSection(
            type: 'dropdown',
            header: 'Tracks Spending Habits',
            body: 'Helps adjust budgets based on actual spending.'),
        ContentSection(
            type: 'dropdown',
            header: 'Avoids Overspending',
            body: 'Shows real-time balances to prevent over-expenditure.'),
        ContentSection(type: 'subtitle', text: 'Ways to Record Transactions:'),
        ContentSection(type: 'list', items: [
          'Notebook: Write transactions by hand',
          'Apps: Automatically track and categorize spending',
          'Spreadsheets: Organize and calculate expenses',
          'Envelope System: Allocate cash for specific needs'
        ]),
        ContentSection(type: 'subtitle', text: 'Key Steps:'),
        ContentSection(type: 'list', items: [
          'Record transactions as they happen',
          'Save receipts for verification',
          'Regularly review entries for accuracy'
        ]),
        ContentSection(
            type: 'paragraph',
            text:
                'Good record-keeping leads to better budgeting and smarter financial decisions!'),
      ],
    ),

    'Stage 3_Level 1_Budgeting': StageContent(
      cardTexts: [
        'Traditional Methods: Handwritten ledgers & envelope system for manual tracking',
        'Digital Tools: Budgeting apps & spreadsheets for automated tracking',
        'Benefits of Digital Tracking: Saves time, improves accuracy, and provides spending reports',
        'Steps to Set Up a Digital Tracker: Choose app → Set categories → Record transactions → Review reports',
      ],
      readingSections: [
        ContentSection(type: 'title', text: 'Tools for Tracking Money'),
        ContentSection(
            type: 'paragraph',
            text:
                'Keeping track of your money helps you stay in control of your spending and savings. There are two main ways to do this: traditional methods and digital tools.'),
        ContentSection(type: 'subtitle', text: 'Traditional Tracking Methods:'),
        ContentSection(type: 'list', items: [
          'Handwritten ledger: Writing transactions in a notebook',
          'Envelope system: Separating cash into labeled envelopes for different expenses'
        ]),
        ContentSection(type: 'subtitle', text: 'Digital Tracking Tools:'),
        ContentSection(type: 'list', items: [
          'Budgeting apps & online trackers: Automatically categorize expenses and generate reports',
          'Spreadsheets: Organize and calculate transactions easily'
        ]),
        ContentSection(type: 'subtitle', text: 'Why Use Digital Tools?'),
        ContentSection(
            type: 'dropdown',
            header: 'Saves time',
            body: 'Automates calculations and categorization'),
        ContentSection(
            type: 'dropdown',
            header: 'Increases accuracy',
            body: 'Reduces manual errors'),
        ContentSection(
            type: 'dropdown',
            header: 'Provides reports',
            body: 'Shows spending patterns for better budgeting'),
        ContentSection(
            type: 'subtitle', text: 'How to Set Up a Digital Tracker:'),
        ContentSection(type: 'list', items: [
          'Choose a budgeting app or software',
          'Enter your income and expense categories',
          'Record transactions as they happen',
          'Review reports to track progress'
        ]),
      ],
    ),

    'Stage 4_Level 1_Budgeting': StageContent(
      cardTexts: [
        'Review spending regularly to track patterns and identify unnecessary expenses',
        'Compare actual spending to your budget to stay on track',
        'Categorize expenses to see where your money goes',
        'Check for errors or unusual charges to avoid mistakes',
        'Adjust spending habits to save more and improve financial health',
      ],
      readingSections: [
        ContentSection(type: 'title', text: 'Analyzing Your Spending'),
        ContentSection(
            type: 'paragraph',
            text:
                'Tracking your money is just the first step—understanding your spending habits helps you make smarter financial choices. Reviewing your transactions regularly allows you to spot patterns, cut unnecessary expenses, and improve budgeting.'),
        ContentSection(type: 'subtitle', text: 'Why Analyze Your Spending?'),
        ContentSection(type: 'list', items: [
          'Helps identify where you\'re overspending',
          'Ensures your spending aligns with your budget',
          'Detects errors or unexpected charges',
          'Guides you in making adjustments to save more'
        ]),
        ContentSection(
            type: 'subtitle', text: 'How to Review Spending Effectively:'),
        ContentSection(type: 'list', items: [
          'Gather your transaction records & receipts',
          'Compare actual spending with your budget',
          'Categorize expenses to see where most of your money goes',
          'Check for mistakes or unusual expenses',
          'Make a plan to adjust spending and save more'
        ]),
      ],
    ),

    'Stage 5_Level 1_Budgeting': StageContent(
      cardTexts: [
        'Why Track Money? Stay in control, avoid overspending, and save effectively',
        'Recording Transactions: Use a notebook, app, or spreadsheet—record immediately to prevent mistakes',
        'Tracking Tools: Digital (Budgeting apps) vs. Traditional (Notebooks, envelope system)',
        'Reviewing Spending: Compare expenses to your budget, spot unnecessary costs, and adjust habits',
        'Smart Money Choices: Tracking and analyzing spending leads to better financial decisions',
      ],
      readingSections: [
        ContentSection(
            type: 'title', text: 'Tracking Your Money: Why It Matters'),
        ContentSection(
            type: 'paragraph',
            text:
                'Managing money wisely starts with tracking your income and expenses. This helps you stay in control, avoid overspending, and save for future goals. Without proper tracking, it\'s easy to lose sight of where your money goes.'),
        ContentSection(
            type: 'subtitle', text: 'Recording Transactions Accurately'),
        ContentSection(
            type: 'paragraph',
            text:
                'Writing down every transaction, whether using a notebook, budgeting app, or spreadsheet, ensures accuracy. Recording transactions immediately prevents mistakes, forgotten expenses, and budget miscalculations.'),
        ContentSection(type: 'subtitle', text: 'Tools for Tracking Money'),
        ContentSection(
            type: 'paragraph',
            text:
                'There are traditional and digital ways to track money. Digital tools (budgeting apps, online trackers) automatically organize spending. Traditional methods (handwritten records, envelope system) provide hands-on budgeting control. Choosing the right tool makes financial tracking easier and more effective.'),
        ContentSection(type: 'subtitle', text: 'Analyzing Spending Habits'),
        ContentSection(
            type: 'paragraph',
            text:
                'Regularly reviewing your spending helps you identify areas to cut costs and improve savings. Compare your actual expenses to your budget, categorize spending, and look for unnecessary purchases. This allows you to adjust habits and make better financial decisions.'),
      ],
    ),

    'Stage 6_Level 0_Budgeting': StageContent(
      cardTexts: [
        'Know Your Income Sources: Allowances, gifts, small jobs',
        'Track Expenses: List fixed (school fees) and variable (entertainment) costs',
        'Needs vs Wants: Prioritize needs (food, transport) over wants (gadgets)',
        'Set Spending Limits: Allocate money for essentials, wants, and savings',
        'Adjust & Improve: Regularly track spending to avoid running out',
      ],
      readingSections: [
        ContentSection(type: 'title', text: 'Student Budgeting Basics'),
        ContentSection(
            type: 'paragraph',
            text:
                'As a student, managing money starts with understanding income sources and differentiating between essential and discretionary spending.'),
        ContentSection(type: 'subtitle', text: 'Income Sources:'),
        ContentSection(type: 'list', items: [
          'Allowances from parents',
          'Gift money',
          'Part-time job earnings',
          'Scholarships/stipends'
        ]),
        ContentSection(type: 'subtitle', text: 'Expense Categories:'),
        ContentSection(
            type: 'dropdown',
            header: 'Fixed Expenses',
            body:
                'School fees, transport passes, phone bills (consistent amounts)'),
        ContentSection(
            type: 'dropdown',
            header: 'Variable Expenses',
            body: 'Food, entertainment, school supplies (fluctuating amounts)'),
        ContentSection(type: 'subtitle', text: 'Budgeting Method:'),
        ContentSection(type: 'list', items: [
          'Use 50% of income for needs',
          '30% for wants',
          '20% for savings',
          'Adjust percentages based on income level'
        ]),
      ],
    ),

    'Stage 1_Level 2_Budgeting': StageContent(
      cardTexts: [
        'Budget hacks help reduce unnecessary spending',
        'Optimization means making the most of your money',
        'Identify expenses, find cheaper alternatives, and set savings goals',
        'Applying hacks can cut costs and improve financial habits',
      ],
      readingSections: [
        ContentSection(type: 'title', text: 'Budget Hacks'),
        ContentSection(
            type: 'paragraph',
            text:
                'A budget hack is a smart way to save money by cutting unnecessary spending. The goal is to make the most of every naira spent.'),
        ContentSection(type: 'subtitle', text: 'Key Concepts:'),
        ContentSection(
            type: 'dropdown',
            header: 'Budget Hack',
            body: 'A trick to reduce daily expenses'),
        ContentSection(
            type: 'dropdown',
            header: 'Optimization',
            body: 'Making your money work efficiently'),
        ContentSection(
            type: 'dropdown',
            header: 'Expense',
            body: 'Money spent on goods or services'),
        ContentSection(
            type: 'dropdown',
            header: 'Savings Goal',
            body: 'A target amount you aim to save'),
        ContentSection(type: 'subtitle', text: 'How to Apply a Budget Hack:'),
        ContentSection(type: 'list', items: [
          'Identify an expense that seems too high',
          'Research cheaper alternatives',
          'Set a small savings goal',
          'Apply the hack and track your progress'
        ]),
        ContentSection(
            type: 'paragraph',
            text:
                'Budget hacks help you spot and adjust regular costs, leading to better money management!'),
      ],
    ),

    // NUMERACY CONTENT - All Levels
    'Stage 1_Level 0_Numeracy': StageContent(
      cardTexts: [
        'Addition Basics: Learn to add different amounts of money to get a total.',
        'Place Value Matters: Align numbers by units, tens, and hundreds.',
        'Everyday Application: Use multi-step addition for shopping, budgeting, and more.',
        'Accuracy: Practice ensures you count every naira correctly.'
      ],
      readingSections: [
        ContentSection(type: 'title', text: 'Multi-Step Addition with Money'),
        ContentSection(
            type: 'paragraph',
            text:
                'Multi-step addition with money is a fundamental skill that helps you accurately calculate the total cost of multiple items. In everyday situations like shopping or budgeting, you often need to add different monetary amounts to determine how much you are spending or how much change you should receive.'),
        ContentSection(
            type: 'paragraph',
            text:
                'For example, when you purchase an item for ₦150 and another for ₦200, adding these amounts gives you a total of ₦350. Mastering this process requires you to align numbers correctly according to their place values—units, tens, and hundreds—so that every naira is properly accounted for.'),
        ContentSection(
            type: 'paragraph',
            text:
                'This skill is essential for managing your money effectively and making informed financial decisions.'),
      ],
    ),

    'Stage 2_Level 2_Budgeting': StageContent(
      cardTexts: [
        'Use Budgeting Tools: Apps or spreadsheets help track income and expenses efficiently',
        'Automatic Payments: Prevents late fees and improves budgeting discipline',
        'Tracking Methods: Digital tools offer automation, while traditional methods provide hands-on control',
        'Budget Hack - Envelope System: Allocate cash into labeled envelopes to limit spending per category',
        'Budget Setup Steps: List income → Record expenses → Set savings goal → Track daily spending → Review & adjust regularly',
      ],
      readingSections: [
        ContentSection(type: 'title', text: 'Effective Budgeting Tools'),
        ContentSection(
            type: 'paragraph',
            text:
                'Effective budgeting requires the right tools and strategies. Budgeting apps or spreadsheets help track income and expenses, making money management easier than using a simple calculator or unstructured notebook.'),
        ContentSection(type: 'subtitle', text: 'Key Strategies:'),
        ContentSection(
            type: 'dropdown',
            header: 'Automation',
            body:
                'Setting up automatic bill payments prevents late fees and improves financial discipline'),
        ContentSection(type: 'subtitle', text: 'Tracking Methods:'),
        ContentSection(type: 'list', items: [
          'Digital tools (budgeting apps, online trackers) for automatic calculations',
          'Traditional methods (handwritten journals, envelope system) for hands-on control'
        ]),
        ContentSection(type: 'subtitle', text: 'Envelope System Hack:'),
        ContentSection(
            type: 'paragraph',
            text:
                'A useful budget hack is the envelope system, which limits spending by dividing cash into labeled envelopes for different categories.'),
        ContentSection(
            type: 'subtitle', text: 'Steps for Setting Up a Budget:'),
        ContentSection(type: 'list', items: [
          'List income',
          'Record expenses',
          'Set a savings goal',
          'Track daily transactions',
          'Review and adjust regularly'
        ]),
      ],
    ),

    'Stage 3_Level 2_Budgeting': StageContent(
      cardTexts: [
        'Plan purchases and compare prices',
        'Use discounts and avoid impulse buying',
        'Make a shopping list and set a budget',
        'Check for deals before purchasing',
        'Review spending to improve habits',
      ],
      readingSections: [
        ContentSection(type: 'title', text: 'Smart Spending Choices'),
        ContentSection(
            type: 'paragraph',
            text:
                'Making smart spending choices helps you get the best value for your money. Instead of buying the cheapest option, compare prices and focus on quality to avoid unnecessary costs.'),
        ContentSection(type: 'subtitle', text: 'Key Strategies:'),
        ContentSection(
            type: 'dropdown',
            header: 'Planning Purchases',
            body:
                'Checking prices, using discounts, and avoiding impulse buying'),
        ContentSection(type: 'subtitle', text: 'Approaches to Spending:'),
        ContentSection(
            type: 'list',
            header: 'Effective Strategies:',
            items: ['Price comparisons', 'Buying in bulk', 'Using coupons']),
        ContentSection(type: 'list', header: 'Risky Habits:', items: [
          'Impulse purchases',
          'Buying without research',
          'Spending on unnecessary sales'
        ]),
        ContentSection(
            type: 'subtitle', text: 'Steps for Cost-Effective Shopping:'),
        ContentSection(type: 'list', items: [
          'Make a detailed shopping list',
          'Set a spending limit',
          'Look for discounts and deals',
          'Compare prices across stores',
          'Review spending after shopping'
        ]),
      ],
    ),

    'Stage 4_Level 2_Budgeting': StageContent(
      cardTexts: [
        'Negotiate bills to save money',
        'Create a budget to track spending',
        'Cut costs: Cancel unused subscriptions, cook at home, use public transport, reduce energy use',
        'Save smart: Use discounts for quick savings, invest in efficiency for long-term benefits',
        'Follow a plan: Review spending → Cut costs → Adjust habits → Monitor savings',
      ],
      readingSections: [
        ContentSection(type: 'title', text: 'Saving Money Strategically'),
        ContentSection(
            type: 'paragraph',
            text:
                'Saving money requires smart planning and reducing unnecessary expenses. One effective way to lower costs is by negotiating with service providers for better rates instead of upgrading or ignoring bills.'),
        ContentSection(type: 'subtitle', text: 'Monthly Budget Strategies:'),
        ContentSection(type: 'list', items: [
          'Canceling unused subscriptions',
          'Planning home-cooked meals',
          'Using public transport',
          'Reducing energy use'
        ]),
        ContentSection(type: 'subtitle', text: 'Types of Savings:'),
        ContentSection(
            type: 'dropdown',
            header: 'Quick Savings',
            body:
                'Using discount coupons, cutting daily expenses like snacks or coffee'),
        ContentSection(
            type: 'dropdown',
            header: 'Long-Term Savings',
            body:
                'Investing in energy-efficient appliances, opening a high-yield savings account'),
        ContentSection(
            type: 'subtitle', text: 'Steps for a Cost-Cutting Plan:'),
        ContentSection(type: 'list', items: [
          'Review spending to find high-cost areas',
          'Identify expenses to reduce or eliminate',
          'Research cheaper alternatives or discounts',
          'Adjust spending habits',
          'Monitor savings over time'
        ]),
      ],
    ),

    'Stage 5_Level 2_Budgeting': StageContent(
      cardTexts: [
        'Use budgeting tools like apps or spreadsheets to track income and expenses',
        'Automate bill payments to avoid late fees',
        'Spend wisely by comparing prices, using discounts, and avoiding impulse purchases',
        'Quick Savings: Use discount coupons and cut small daily expenses',
        'Long-Term Savings: Invest in high-yield savings accounts and energy-efficient choices',
        'Steps to Save More: Identify unnecessary costs → Use budgeting tools → Control spending → Track and adjust goals',
      ],
      readingSections: [
        ContentSection(type: 'title', text: 'Growing Your Savings'),
        ContentSection(
            type: 'paragraph',
            text:
                'Growing your savings goes beyond setting money aside—it requires smart spending, budgeting, and cost-cutting strategies. Budgeting tools like apps and spreadsheets help track income and expenses, while automation ensures bills are paid on time, avoiding unnecessary fees.'),
        ContentSection(type: 'subtitle', text: 'Smart Spending Principles:'),
        ContentSection(type: 'list', items: [
          'Comparing prices',
          'Using discounts',
          'Planning purchases',
          'Avoiding impulse buying'
        ]),
        ContentSection(type: 'subtitle', text: 'Savings Strategies:'),
        ContentSection(
            type: 'dropdown',
            header: 'Quick Savings',
            body:
                'Using discount coupons, reducing daily expenses, tracking spending habits'),
        ContentSection(
            type: 'dropdown',
            header: 'Long-Term Savings',
            body:
                'Investing in high-yield savings accounts, making cost-effective choices like energy-efficient appliances'),
        ContentSection(type: 'subtitle', text: 'Steps to Strengthen Savings:'),
        ContentSection(type: 'list', items: [
          'Identify unnecessary expenses and cut costs',
          'Use budgeting tools to manage finances',
          'Develop disciplined spending habits',
          'Track and adjust financial goals regularly'
        ]),
        ContentSection(
            type: 'paragraph',
            text:
                'By applying these strategies, you can build stronger savings and achieve long-term financial stability.'),
      ],
    ),
    'Stage 6_Level 1_Budgeting': StageContent(
      cardTexts: [
        'Needs vs Wants: Spend on essentials before non-essentials',
        'Tracking Expenses: Helps identify spending habits',
        'Impulse Buying: Avoid unplanned purchases',
        'Setting Limits: Allocate money wisely across categories',
        'Budgeting Rule: Adapt the 50/30/20 framework',
      ],
      readingSections: [
        ContentSection(type: 'title', text: 'Smart Spending for Students'),
        ContentSection(
            type: 'paragraph',
            text:
                'Students can avoid financial stress by making conscious spending decisions and developing healthy money habits early.'),
        ContentSection(type: 'subtitle', text: 'Avoiding Overspending:'),
        ContentSection(type: 'list', items: [
          'Wait 24 hours before non-essential purchases',
          'Use campus resources (free meals, events)',
          'Share costs with roommates',
          'Take advantage of student discounts'
        ]),
        ContentSection(type: 'subtitle', text: 'Practical Tips:'),
        ContentSection(
            type: 'dropdown',
            header: 'Textbook Savings',
            body: 'Buy used, rent, or use library copies'),
        ContentSection(
            type: 'dropdown',
            header: 'Food Budgeting',
            body: 'Meal prep instead of eating out'),
      ],
    ),

    'Stage 1_Level 3_Budgeting': StageContent(
      cardTexts: [
        'Financial goals guide saving and spending',
        'Types: Short-term, long-term, emergency fund, purchase goal',
        'Steps: Decide, set amount, timeline, adjust spending',
        'Clear goals = smarter money choices',
      ],
      readingSections: [
        ContentSection(type: 'title', text: 'Introduction to Financial Goals'),
        ContentSection(
            type: 'paragraph',
            text:
                'Financial goals help you manage money wisely by setting clear targets for saving or spending. A goal gives your money a purpose and helps with better financial decisions.'),
        ContentSection(type: 'subtitle', text: 'Types of Financial Goals:'),
        ContentSection(
            type: 'dropdown',
            header: 'Short-term Goals',
            body: 'Achieved in a few months (e.g., saving for a gadget)'),
        ContentSection(
            type: 'dropdown',
            header: 'Long-term Goals',
            body: 'Take several years to accomplish (e.g., college tuition)'),
        ContentSection(
            type: 'dropdown',
            header: 'Emergency Fund',
            body: 'Savings for unexpected expenses'),
        ContentSection(
            type: 'dropdown',
            header: 'Purchase Goal',
            body: 'Saving for a specific item like a bike or laptop'),
        ContentSection(
            type: 'subtitle', text: 'Steps to Set a Financial Goal:'),
        ContentSection(type: 'list', items: [
          'Decide what you want to achieve',
          'Determine the amount needed',
          'Set a timeline',
          'Adjust spending to meet your goal'
        ]),
      ],
    ),

    'Stage 2_Level 3_Budgeting': StageContent(
      cardTexts: [
        'SMART goals are clear, trackable, and achievable',
        'Key Elements: Specific, Measurable, Achievable, Relevant, Time-bound',
        'Steps: Define → Measure → Assess → Align → Set Deadline',
        'Benefit: Helps with better financial planning and goal achievement',
      ],
      readingSections: [
        ContentSection(type: 'title', text: 'SMART Financial Goals'),
        ContentSection(
            type: 'paragraph',
            text:
                'Setting financial goals using the SMART method helps you stay focused and achieve success. A SMART goal is:'),
        ContentSection(type: 'subtitle', text: 'SMART Criteria:'),
        ContentSection(
            type: 'dropdown',
            header: 'Specific',
            body:
                'Clearly defined with a clear objective (e.g., "Save ¥50,000 for school trip")'),
        ContentSection(
            type: 'dropdown',
            header: 'Measurable',
            body: 'You can track progress (e.g., "Save ¥10,000 per month")'),
        ContentSection(
            type: 'dropdown',
            header: 'Achievable',
            body: 'Realistic based on your income and expenses'),
        ContentSection(
            type: 'dropdown',
            header: 'Relevant',
            body: 'Important to your financial situation or future plans'),
        ContentSection(
            type: 'dropdown',
            header: 'Time-bound',
            body: 'Has a deadline (e.g., "Reach goal in 6 months")'),
        ContentSection(type: 'subtitle', text: 'Steps to Create a SMART Goal:'),
        ContentSection(type: 'list', items: [
          'Define exactly what you want to achieve',
          'Measure progress with clear amounts',
          'Ensure the goal is realistic',
          'Confirm it aligns with your needs',
          'Set a deadline to stay motivated'
        ]),
      ],
    ),

    'Stage 3_Level 3_Budgeting': StageContent(
      cardTexts: [
        'Set a Goal: Know what you\'re saving for',
        'Pick a Method: Use automatic transfers or envelope system',
        'Cut Costs: Track spending, reduce extras',
        'Follow a Plan: Set an amount, save regularly, adjust as needed',
        'Stay on Track: Monitor progress to reach your goal',
      ],
      readingSections: [
        ContentSection(type: 'title', text: 'Savings Strategies'),
        ContentSection(
            type: 'paragraph',
            text:
                'Effective savings methods help you reach financial goals through disciplined planning and execution.'),
        ContentSection(type: 'subtitle', text: 'Effective Savings Methods:'),
        ContentSection(
            type: 'dropdown',
            header: 'Automatic Transfers',
            body: 'Set up scheduled deposits into savings'),
        ContentSection(
            type: 'dropdown',
            header: 'Envelope System',
            body: 'Physically separate cash for different goals'),
        ContentSection(
            type: 'dropdown',
            header: 'Percentage Saving',
            body: 'Dedicate fixed portion of income to savings'),
        ContentSection(
            type: 'dropdown',
            header: 'Cost Cutting',
            body: 'Reduce non-essential spending'),
        ContentSection(
            type: 'subtitle', text: 'Steps to Create a Savings Plan:'),
        ContentSection(type: 'list', items: [
          'Identify your financial goal and cost',
          'Determine weekly/monthly savings amount',
          'Select a savings method',
          'Adjust spending habits',
          'Monitor progress consistently'
        ]),
      ],
    ),

    'Stage 4_Level 3_Budgeting': StageContent(
      cardTexts: [
        'List Income: Identify all sources to know available funds',
        'Categorize Expenses: Separate essentials from non-essentials',
        'Prioritize Savings: Set aside money for goals before wants',
        'Use Budgeting Method: Apply 50/30/20 rule (50% needs, 30% wants, 20% savings)',
        'Track & Adjust: Review spending regularly and adjust to stay on target',
      ],
      readingSections: [
        ContentSection(type: 'title', text: 'Budgeting for Financial Goals'),
        ContentSection(
            type: 'paragraph',
            text:
                'A well-structured budget helps you manage income, cover essential expenses, and save for financial goals through systematic planning.'),
        ContentSection(type: 'subtitle', text: 'Steps to Create a Budget:'),
        ContentSection(type: 'list', items: [
          'List all sources of income',
          'Categorize expenses (essentials vs non-essentials)',
          'Prioritize savings allocations',
          'Allocate funds using 50/30/20 rule',
          'Track and adjust monthly'
        ]),
        ContentSection(type: 'subtitle', text: 'Budgeting Methods:'),
        ContentSection(
            type: 'dropdown',
            header: '50/30/20 Rule',
            body: '50% needs, 30% wants, 20% savings/debt repayment'),
        ContentSection(
            type: 'dropdown',
            header: 'Zero-Based Budgeting',
            body: 'Every naira is assigned a purpose'),
      ],
    ),

    'Stage 5_Level 3_Budgeting': StageContent(
      cardTexts: [
        'Financial goals guide saving & spending',
        'SMART goals = Specific, Measurable, Achievable, Relevant, Time-bound',
        'Savings methods: Automatic transfers, envelope system, percentage saving',
        'Budgeting steps: List income, categorize expenses, prioritize savings, track & adjust',
        '50/30/20 rule: 50% needs, 30% wants, 20% savings',
      ],
      readingSections: [
        ContentSection(type: 'title', text: 'Mastering Financial Goals'),
        ContentSection(
            type: 'paragraph',
            text:
                'Achieving financial goals requires combining smart planning, disciplined saving, and consistent budgeting practices.'),
        ContentSection(type: 'subtitle', text: 'Key Concepts:'),
        ContentSection(
            type: 'dropdown',
            header: 'Compound Savings',
            body: 'Interest helps savings grow faster over time'),
        ContentSection(
            type: 'dropdown',
            header: 'Financial Discipline',
            body: 'Consistency in saving and spending habits'),
        ContentSection(type: 'subtitle', text: 'Budgeting Framework:'),
        ContentSection(type: 'list', items: [
          'Track all income sources',
          'Categorize expenses clearly',
          'Automate savings transfers',
          'Review monthly spending patterns',
          'Adjust allocations quarterly'
        ]),
        ContentSection(type: 'subtitle', text: 'Saving vs Investing:'),
        ContentSection(
            type: 'dropdown',
            header: 'Saving',
            body: 'Safe growth for short-term goals'),
        ContentSection(
            type: 'dropdown',
            header: 'Investing',
            body: 'Higher-risk growth for long-term goals'),
      ],
    ),

    'Stage 6_Level 2_Budgeting': StageContent(
      cardTexts: [
        'Short-term savings: For immediate goals (1-3 years)',
        'Long-term savings: For bigger future goals (3+ years)',
        'Steps to saving: Define goal → Set timeline → Choose method → Track progress',
        'Balance: Save for both short and long-term needs',
      ],
      readingSections: [
        ContentSection(type: 'title', text: 'Student Savings Strategies'),
        ContentSection(
            type: 'paragraph',
            text:
                'Effective saving as a student requires setting clear goals and using appropriate methods based on timeline and purpose.'),
        ContentSection(type: 'subtitle', text: 'Savings Goals Examples:'),
        ContentSection(
            type: 'list',
            header: 'Short-term (0-2 years):',
            items: ['Emergency fund (₦20,000)', 'New laptop', 'School trip']),
        ContentSection(type: 'list', header: 'Long-term (3+ years):', items: [
          'University tuition',
          'Study abroad fund',
          'Post-graduation relocation'
        ]),
        ContentSection(type: 'subtitle', text: 'Savings Methods:'),
        ContentSection(
            type: 'dropdown',
            header: 'Digital Tools',
            body: 'Savings apps with round-up features'),
        ContentSection(
            type: 'dropdown',
            header: 'Traditional Methods',
            body: 'Envelope system for visual tracking'),
      ],
    ),

    'Stage 1_Level 4_Budgeting': StageContent(
      cardTexts: [
        'Plan First: List income and expenses before spending',
        'Track Spending: Record expenses, set limits, and compare prices',
        'Shop Smart: Plan purchases, check budgets, and keep receipts',
        'Follow Order: List → Budget → Compare → Buy → Record',
        'Stay in Control: Smart budgeting prevents overspending!',
      ],
      readingSections: [
        ContentSection(type: 'title', text: 'Real-World Budgeting Basics'),
        ContentSection(
            type: 'paragraph',
            text:
                'Practical budgeting requires planning before spending, tracking transactions, and making smart purchasing decisions in everyday situations.'),
        ContentSection(type: 'subtitle', text: 'Key Strategies:'),
        ContentSection(type: 'list', items: [
          'List income and planned expenses before shopping',
          'Prioritize essential expenses (food, transport) before wants',
          'Record daily expenses to identify spending patterns',
          'Set spending limits for different categories',
          'Compare prices to get best value'
        ]),
        ContentSection(type: 'subtitle', text: 'Shopping Process:'),
        ContentSection(
            type: 'dropdown',
            header: 'Before Buying',
            body: 'Make list → Check budget → Compare prices'),
        ContentSection(
            type: 'dropdown',
            header: 'After Buying',
            body: 'Keep receipts → Update budget'),
        ContentSection(type: 'subtitle', text: 'Spending Order:'),
        ContentSection(type: 'list', items: [
          '1. Make shopping list',
          '2. Check budget limits',
          '3. Compare options/prices',
          '4. Purchase wisely',
          '5. Record transaction'
        ]),
      ],
    ),

    'Stage 2_Level 4_Budgeting': StageContent(
      cardTexts: [
        'Emergency Fund: Covers surprise expenses',
        'Budget Steps: Identify → Check savings → Adjust → Record → Plan',
        'Expense Types: Planned (rent) vs Unexpected (repairs)',
        'Handling: Use savings, cut non-essentials, adjust budget',
      ],
      readingSections: [
        ContentSection(type: 'title', text: 'Managing Unexpected Expenses'),
        ContentSection(
            type: 'paragraph',
            text:
                'Unexpected expenses can disrupt your budget, but with proper planning and an emergency fund, you can maintain financial stability.'),
        ContentSection(type: 'subtitle', text: 'Emergency Fund Purpose:'),
        ContentSection(
            type: 'paragraph',
            text:
                'Money set aside for sudden expenses like medical bills or urgent repairs that helps avoid financial stress.'),
        ContentSection(type: 'subtitle', text: 'Budget Adjustment Steps:'),
        ContentSection(type: 'list', items: [
          'Identify the expense urgency',
          'Check emergency fund availability',
          'Reallocate non-essential funds',
          'Record the unexpected cost',
          'Plan for future similar expenses'
        ]),
        ContentSection(type: 'subtitle', text: 'Expense Types:'),
        ContentSection(
            type: 'list',
            header: 'Planned Expenses:',
            items: ['Rent', 'Utilities', 'Groceries']),
        ContentSection(type: 'list', header: 'Unexpected Expenses:', items: [
          'Car repairs',
          'Medical emergencies',
          'Appliance breakdowns'
        ]),
      ],
    ),

    'Stage 3_Level 4_Budgeting': StageContent(
      cardTexts: [
        'Budget Forecasting helps predict future income and expenses',
        'Steps: Review past spending → Anticipate costs → Estimate income → Adjust budget → Update regularly',
        'Benefit: Prevents financial stress and ensures better planning',
      ],
      readingSections: [
        ContentSection(type: 'title', text: 'Budget Forecasting'),
        ContentSection(
            type: 'paragraph',
            text:
                'Forecasting helps predict future income and expenses so you can plan ahead for seasonal costs, irregular bills, and savings goals.'),
        ContentSection(type: 'subtitle', text: 'Forecasting Process:'),
        ContentSection(type: 'list', items: [
          'Analyze 3-6 months of past spending',
          'Account for seasonal variations (holidays, school fees)',
          'Project income changes (raises, side jobs)',
          'Adjust budget categories accordingly',
          'Review accuracy monthly'
        ]),
        ContentSection(type: 'subtitle', text: 'Forecasting Tools:'),
        ContentSection(
            type: 'dropdown',
            header: 'Spreadsheets',
            body: 'Create custom projections with formulas'),
        ContentSection(
            type: 'dropdown',
            header: 'Budgeting Apps',
            body: 'Automate trend analysis and alerts'),
      ],
    ),
    'Stage 4_Level 4_Budgeting': StageContent(
      cardTexts: [
        'Compare spending vs budget to identify differences',
        'Spot overspending & underspending to adjust funds',
        'Reallocate money to essentials or savings',
        'Modify your budget based on spending trends',
        'Review regularly to stay on track',
        'Stay flexible to prevent financial stress',
      ],
      readingSections: [
        ContentSection(type: 'title', text: 'Budget Adjustments'),
        ContentSection(
            type: 'paragraph',
            text:
                'Regular budget reviews help identify spending patterns, reallocate funds, and maintain financial health through continuous improvement.'),
        ContentSection(type: 'subtitle', text: 'Adjustment Process:'),
        ContentSection(type: 'list', items: [
          'Compare actual vs planned spending',
          'Identify categories needing adjustment',
          'Shift funds between categories',
          'Update future month allocations',
          'Document lessons learned'
        ]),
        ContentSection(type: 'subtitle', text: 'Adjustment Strategies:'),
        ContentSection(
            type: 'dropdown',
            header: 'Overspending',
            body: 'Reduce category limits or find cheaper alternatives'),
        ContentSection(
            type: 'dropdown',
            header: 'Underspending',
            body: 'Reallocate surplus to savings or debt'),
      ],
    ),
    'Stage 5_Level 4_Budgeting': StageContent(
      cardTexts: [
        'Forecasting: Predict future income/expenses for seasonal costs',
        'Handling Unexpected Costs: Use emergency funds and budget adjustments',
        'Using Budget Feedback: Compare planned vs actual spending',
        'Making Smart Adjustments: Track → Identify → Reallocate → Update → Monitor',
        'Goal: Stay flexible and manage money wisely',
      ],
      readingSections: [
        ContentSection(type: 'title', text: 'Advanced Budget Management'),
        ContentSection(
            type: 'paragraph',
            text:
                'Mastering real-world budgeting requires combining forecasting, emergency planning, and continuous adjustment based on actual spending patterns.'),
        ContentSection(type: 'subtitle', text: 'Key Techniques:'),
        ContentSection(
            type: 'dropdown',
            header: 'Rolling Budgets',
            body: 'Update projections monthly for accuracy'),
        ContentSection(
            type: 'dropdown',
            header: 'Sinking Funds',
            body: 'Save gradually for predictable irregular expenses'),
        ContentSection(type: 'subtitle', text: 'Adjustment Framework:'),
        ContentSection(type: 'list', items: [
          'Weekly expense tracking',
          'Monthly budget reviews',
          'Quarterly goal reassessments',
          'Annual financial checkups'
        ]),
        ContentSection(type: 'subtitle', text: 'Tools for Success:'),
        ContentSection(type: 'list', items: [
          'Budgeting apps with alerts',
          'Separate savings accounts',
          'Spending analytics reports',
          'Receipt scanning tools'
        ]),
      ],
    ),

    'Stage 6_Level 3_Budgeting': StageContent(
      cardTexts: [
        'Set a Budget: Allocate specific amount for social activities',
        'Find Affordable Fun: Choose low-cost hangout options',
        'Say No When Needed: Don\'t feel pressured to overspend',
        'Be Yourself: Avoid spending just to fit in',
        'Choose Supportive Friends: True friends respect your budget',
      ],
      readingSections: [
        ContentSection(
            type: 'title', text: 'Handling Social Spending Pressure'),
        ContentSection(
            type: 'paragraph',
            text:
                'Students often face pressure to spend on social activities, but maintaining financial boundaries is crucial for long-term stability.'),
        ContentSection(type: 'subtitle', text: 'Budget-Friendly Socializing:'),
        ContentSection(type: 'list', items: [
          'Host potluck dinners instead of restaurants',
          'Organize game nights',
          'Explore free campus events',
          'Use group discounts for outings'
        ]),
        ContentSection(
            type: 'subtitle', text: 'Responses to Spending Pressure:'),
        ContentSection(
            type: 'dropdown',
            header: 'Direct Approach',
            body:
                '"I\'m saving for ___, so let\'s do something more affordable"'),
        ContentSection(
            type: 'dropdown',
            header: 'Alternative Suggestion',
            body: '"Instead of the mall, let\'s ___"'),
      ],
    ),

    'Stage 6_Level 4_Budgeting': StageContent(
      cardTexts: [
        'Calculate Income: Know take-home pay after taxes',
        'Essential Expenses First: Rent, utilities, loan payments',
        'Automate Savings: Pay yourself first',
        'Track Discretionary Spending: Food, entertainment, shopping',
        'Review Monthly: Adjust allocations as needed',
      ],
      readingSections: [
        ContentSection(type: 'title', text: 'First Job Budgeting'),
        ContentSection(
            type: 'paragraph',
            text:
                'Transitioning to professional life requires adapting budgeting strategies to handle new financial responsibilities and opportunities.'),
        ContentSection(type: 'subtitle', text: 'Budget Breakdown Example:'),
        ContentSection(type: 'list', items: [
          '50% to necessities (housing, food, transport)',
          '20% to savings/debt repayment',
          '15% to retirement/investments',
          '15% to discretionary spending'
        ]),
        ContentSection(type: 'subtitle', text: 'Professional Expenses:'),
        ContentSection(
            type: 'dropdown',
            header: 'Expected Costs',
            body: 'Work wardrobe, commuting, professional memberships'),
        ContentSection(
            type: 'dropdown',
            header: 'Unexpected Costs',
            body: 'Last-minute work trips, client meals, equipment repairs'),
      ],
    ),

    'Stage 2_Level 0_Numeracy': StageContent(
      cardTexts: [
        'Accurate Subtraction: Learn to subtract item costs from your total money.',
        'Making Change: Understand how to calculate the difference between what you pay and the cost.',
        'Everyday Application: Use these skills in daily transactions, whether shopping or budgeting.',
        'Attention to Detail: Focus on careful calculation to ensure every naira is accounted for.'
      ],
      readingSections: [
        ContentSection(
            type: 'title', text: 'Multi-Step Subtraction & Making Change'),
        ContentSection(
            type: 'paragraph',
            text:
                'Multi-step subtraction and making change is a vital arithmetic skill that helps you manage your money accurately in everyday transactions. This topic focuses on subtracting the cost of items from the money you have and calculating the change you should receive.'),
        ContentSection(
            type: 'paragraph',
            text:
                'For example, if you have ₦500 and spend ₦275, you subtract 275 from 500 to find that your change is ₦225. By mastering these techniques, you ensure that every naira is accounted for, whether you\'re shopping or budgeting.'),
      ],
    ),

    'Stage 3_Level 0_Numeracy': StageContent(
      cardTexts: [
        'Price Comparison: Identify which items are cheaper to maximize value.',
        'Smart Shopping: Use comparisons to choose the best deals.',
        'Real-Life Application: Apply these skills while shopping or planning a budget.',
        'Informed Decisions: Understand how small price differences can affect your spending.'
      ],
      readingSections: [
        ContentSection(type: 'title', text: 'Comparing Monetary Values'),
        ContentSection(
            type: 'paragraph',
            text:
                'Comparing monetary values involves evaluating the prices of different items to determine which offers the best value for your money. This skill is essential when shopping or budgeting, as it helps you make informed decisions about where to spend your money.'),
        ContentSection(
            type: 'paragraph',
            text:
                'For example, if one pen costs ₦80 and another costs ₦100, the ₦80 option is more economical—especially when you\'re trying to stick to a budget. By learning to compare prices accurately, you not only save money but also develop an understanding of how even small differences in cost can impact your overall spending.'),
        ContentSection(
            type: 'paragraph',
            text:
                'This practice ensures that each naira is well spent and that you maximize the value of every purchase.'),
      ],
    ),

    'Stage 4_Level 0_Numeracy': StageContent(
      cardTexts: [
        'Combine Skills: Use addition and subtraction together in real-world shopping situations.',
        'Calculate Change: Determine how much money remains after purchases.',
        'Real-Life Application: Practice handling everyday transactions with confidence.',
        'Accuracy Matters: Ensure every naira is accounted for when making purchases.'
      ],
      readingSections: [
        ContentSection(type: 'title', text: 'Real-Life Transaction Scenarios'),
        ContentSection(
            type: 'paragraph',
            text:
                'Real-life transaction scenarios involve using your math skills to manage everyday purchases. In these situations, you combine addition and subtraction to calculate the total cost of multiple items and determine how much change you should receive.'),
        ContentSection(
            type: 'paragraph',
            text:
                'For instance, if you have ₦500, then purchase an item for ₦275 and another for ₦100, you\'ll need to add the costs to find your total spending and then subtract that from ₦500 to know how much money is left.'),
        ContentSection(
            type: 'paragraph',
            text:
                'Mastering these skills ensures that you always have an accurate understanding of your available funds during shopping, helping you manage your money effectively.'),
      ],
    ),

    'Stage 5_Level 0_Numeracy': StageContent(
      cardTexts: [
        'Addition & Subtraction: Combine amounts and calculate remaining money accurately.',
        'Change-Making: Determine the correct change from transactions.',
        'Price Comparison: Identify best deals by comparing monetary values.',
        'Real-World Application: Apply these skills in realistic shopping and budgeting scenarios.'
      ],
      readingSections: [
        ContentSection(
            type: 'title', text: 'Enhanced Money Calculations Summary'),
        ContentSection(
            type: 'paragraph',
            text:
                'This summary quiz reviews everything you\'ve learned in Level 1. You\'ve practiced multi-step addition, subtraction, making change, and comparing monetary values in everyday transactions.'),
        ContentSection(
            type: 'paragraph',
            text:
                'Now, test your overall understanding and ensure you can confidently add prices, subtract costs, and determine the best deals in real-life scenarios. Mastery of these skills is essential for managing money accurately and making smart financial decisions.'),
      ],
    ),

    'Stage 1_Level 1_Numeracy': StageContent(
      cardTexts: [
        'Conversion Process: Write the fraction as division, perform division, record the decimal.',
        'Real-World Use: Converting fractions helps in understanding discounts, taxes, and prices.',
        'Key Equivalents: 1/2 = 0.5, 1/4 = 0.25, and so on.',
        'Link to Percentages: Decimals can be converted to percentages by multiplying by 100.'
      ],
      readingSections: [
        ContentSection(
            type: 'title', text: 'Converting Fractions and Decimals'),
        ContentSection(
            type: 'paragraph',
            text:
                'Fractions and decimals are two ways of expressing parts of a whole. A fraction like 1/2 shows that one part is taken from two equal parts, while its decimal equivalent, 0.5, is obtained by dividing the numerator (1) by the denominator (2). This conversion is essential for understanding discounts, taxes, and other financial calculations in everyday life.'),
        ContentSection(
            type: 'subtitle', text: 'To convert a fraction to a decimal:'),
        ContentSection(type: 'numbered_list', items: [
          'Write the fraction as a division problem (e.g., 1 ÷ 2).',
          'Perform the division using long division or a calculator.',
          'Record the resulting decimal number.'
        ]),
        ContentSection(
            type: 'paragraph',
            text:
                'For example, converting 1/4 into a decimal involves dividing 1 by 4, which equals 0.25. This process applies to other fractions as well. Recognizing these equivalents allows you to compare prices more effectively and make informed financial decisions.'),
        ContentSection(
            type: 'paragraph',
            text:
                'Percentages are closely related, as they express a fraction out of 100. For instance, 0.5 as a percentage is 50%, and 0.25 is 25%. Understanding these concepts is vital for calculating discounts and interpreting sales offers.'),
      ],
    ),

    'Stage 2_Level 1_Numeracy': StageContent(
      cardTexts: [
        'Percentage Basics: Expresses a part out of 100.',
        'Conversion: Divide the percentage by 100 to get the decimal equivalent.',
        'Calculation: Multiply the decimal by the total amount to find the percentage value.',
        'Real-World Use: Helps calculate discounts, taxes, and interest.'
      ],
      readingSections: [
        ContentSection(
            type: 'title', text: 'Understanding Percentages in Daily Finance'),
        ContentSection(
            type: 'paragraph',
            text:
                'Percentages represent parts of a whole and are commonly used in everyday finance, such as calculating discounts, taxes, and interest. A percentage is essentially a fraction out of 100. For example, 25% means 25 out of 100, or 0.25 in decimal form.'),
        ContentSection(
            type: 'paragraph',
            text:
                'When you see a sale with a 30% discount, it means you only pay 70% of the original price. To calculate a percentage of an amount, convert the percentage to a decimal (by dividing by 100) and then multiply by the total amount. For instance, to find 20% of ₦500, convert 20% to 0.20 and multiply: 0.20 × 500 = ₦100.'),
        ContentSection(
            type: 'paragraph',
            text:
                'Understanding these concepts helps you evaluate deals, determine savings, and interpret financial offers accurately.'),
      ],
    ),

    'Stage 3_Level 1_Numeracy': StageContent(
      cardTexts: [
        'Discount Calculation: Convert percentage to decimal, multiply by the original price, then subtract.',
        'Real-World Application: Helps you understand sale prices and savings.',
        'Simple Process: Three clear steps to find the final price.',
        'Smart Shopping: Use these skills to decide if a deal is really good.'
      ],
      readingSections: [
        ContentSection(
            type: 'title', text: 'Calculating Discounts and Sales Prices'),
        ContentSection(
            type: 'paragraph',
            text:
                'When shopping, discounts help you save money by reducing the original price of an item. To calculate the sale price, follow these steps:'),
        ContentSection(type: 'numbered_list', items: [
          'Convert the Discount Percentage: Divide the discount percentage by 100 to get its decimal form. For example, 25% becomes 0.25.',
          'Find the Discount Amount: Multiply the original price by the decimal. If an item costs ₦1,000 and the discount is 25%, the discount amount is 1,000 × 0.25 = ₦250.',
          'Calculate the Sale Price: Subtract the discount amount from the original price. In our example, the sale price is ₦1,000 – ₦250 = ₦750.'
        ]),
        ContentSection(
            type: 'paragraph',
            text:
                'Understanding this process helps you quickly determine the final price of items during sales and make smarter spending decisions.'),
      ],
    ),

    'Stage 4_Level 1_Numeracy': StageContent(
      cardTexts: [
        'Compare Deals: Evaluate both the percentage discount and the final sale price.',
        'Calculation Skills: Use fractions, decimals, and percentages to determine savings.',
        'Smart Shopping: Decide which offer provides the best value.',
        'Real-World Application: Apply these skills to everyday purchases and sales.'
      ],
      readingSections: [
        ContentSection(
            type: 'title',
            text: 'Evaluating Sales Offers and Price Comparisons'),
        ContentSection(
            type: 'paragraph',
            text:
                'In everyday shopping, it\'s important not only to calculate discounts but also to evaluate different sales offers to determine the best value for your money. When comparing deals, consider both the percentage discount and the final sale price.'),
        ContentSection(
            type: 'paragraph',
            text:
                'For example, an item originally priced at ₦1,000 may be offered at a 20% discount in one store and a 25% discount in another. Although the higher percentage seems better, you must calculate the sale price for each to decide which offer saves you more money.'),
        ContentSection(
            type: 'paragraph',
            text:
                'Learning to compare these figures using fractions, decimals, and percentages will help you spot the best deals and make informed choices when shopping.'),
      ],
    ),

    'Stage 5_Level 1_Numeracy': StageContent(
      cardTexts: [
        'Conversions: Fractions are converted to decimals by division (e.g., 1/2 = 0.5).',
        'Percentages: Represent parts of 100; convert to decimals by dividing by 100.',
        'Discount Calculations: Multiply the original price by the discount (in decimal form) to find the discount amount, then subtract.',
        'Smart Shopping: Use these skills to compare deals and determine the best value.'
      ],
      readingSections: [
        ContentSection(
            type: 'title',
            text: 'Fractions, Decimals, and Percentages Summary'),
        ContentSection(
            type: 'paragraph',
            text:
                'In this level, you\'ve learned that fractions, decimals, and percentages are different ways to represent parts of a whole. A fraction like 1/2 means one out of two equal parts, and when you convert it to a decimal by dividing 1 by 2, you get 0.5. Similarly, 1/4 becomes 0.25, and 1/5 becomes 0.20. These conversions are essential because they form the basis for many financial calculations.'),
        ContentSection(
            type: 'paragraph',
            text:
                'Percentages express a number out of 100. For example, 25% means 25 out of 100, which is the same as 0.25 in decimal form. Converting a percentage to a decimal is done by dividing the percentage by 100. Percentages are used to calculate discounts, taxes, and interest. When an item is on sale, a 30% discount means you pay 70% of the original price.'),
        ContentSection(
            type: 'paragraph',
            text:
                'To determine the discount amount, multiply the original price by the discount percentage (in decimal form); then subtract that from the original price to find the sale price. Mastering these conversions and calculations helps you evaluate sales offers effectively. Whether you\'re comparing discounts or figuring out how much you save, understanding how fractions, decimals, and percentages work together enables you to make smart financial decisions every day.'),
      ],
    ),

    'Stage 1_Level 2_Numeracy': StageContent(
      cardTexts: [
        'Multiplication Basics: Multiply the unit price by the number of items.',
        'Real-World Application: Calculate the total cost when buying multiple items.',
        'Budgeting Skills: Use multiplication to plan how much money you need.',
        'Quick Calculations: Faster decision-making during shopping.'
      ],
      readingSections: [
        ContentSection(type: 'title', text: 'Multiplying to Find Total Cost'),
        ContentSection(
            type: 'paragraph',
            text:
                'When you buy more than one item, you need to calculate the total cost by multiplying the price of a single item by the quantity you purchase. For example, if one notebook costs ₦150 and you buy 4 notebooks, you multiply 150 by 4 to get ₦600.'),
        ContentSection(
            type: 'paragraph',
            text:
                'This process helps you quickly determine how much you\'ll spend overall. Multiplication is essential for budgeting, comparing deals on bulk items, and ensuring you have enough money for your purchases. Practice these multiplication skills to become confident in handling everyday shopping scenarios.'),
      ],
    ),

    'Stage 2_Level 2_Numeracy': StageContent(
      cardTexts: [
        'Division for Unit Cost: Divide the total cost by the number of items.',
        'Cost Allocation: Determine the price per item to compare deals.',
        'Budgeting: Use division to split expenses and manage money wisely.',
        'Practical Application: Essential for evaluating bulk deals and sales offers.'
      ],
      readingSections: [
        ContentSection(
            type: 'title',
            text: 'Division in Cost Allocation and Unit Pricing'),
        ContentSection(
            type: 'paragraph',
            text:
                'Division is a key tool for understanding how much each item costs when purchased in bulk or when splitting a total cost among several items. By dividing the total cost by the number of items, you can determine the unit price.'),
        ContentSection(
            type: 'paragraph',
            text:
                'This is particularly useful when comparing different packages or deals to see which offers the best value. For example, if a pack of 12 pencils costs ₦360, dividing ₦360 by 12 shows that each pencil costs ₦30. Learning to use division in this way helps you make smarter purchasing decisions and manage your budget more effectively.'),
      ],
    ),

    'Stage 3_Level 2_Numeracy': StageContent(
      cardTexts: [
        'Calculate Unit Price: Divide total cost by the number of items.',
        'Compare Deals: Lower unit price usually means a better deal.',
        'Smarter Purchases: Use unit pricing to choose the most cost-effective option.',
        'Real-World Application: Essential for comparing bulk or multi-item deals.'
      ],
      readingSections: [
        ContentSection(type: 'title', text: 'Unit Price Analysis'),
        ContentSection(
            type: 'paragraph',
            text:
                'Unit price analysis is a useful method for comparing the value of different packages or deals. Instead of looking at the total cost, you divide the total price by the number of items to determine the cost per individual unit.'),
        ContentSection(
            type: 'paragraph',
            text:
                'For example, if a pack of 12 pencils costs ₦600, the unit price is ₦600 ÷ 12 = ₦50 per pencil. This calculation helps you decide which option is the best value, especially when different packs have varying quantities or prices. By comparing the unit prices, you can make smarter purchasing decisions and ensure that you get the most for your money.'),
      ],
    ),

    'Stage 4_Level 2_Numeracy': StageContent(
      cardTexts: [
        'Combine Operations: Use multiplication for individual totals and addition to combine them.',
        'Budgeting: Calculate the total cost of varied items to manage your spending.',
        'Real-World Skills: Apply these techniques to shopping scenarios involving different products.',
        'Accuracy: Practice careful calculation to avoid overspending.'
      ],
      readingSections: [
        ContentSection(type: 'title', text: 'Multi-Item Purchase Scenarios'),
        ContentSection(
            type: 'paragraph',
            text:
                'In real-life shopping, you often buy multiple types of items at once. Calculating the total cost in these scenarios involves a combination of multiplication (to find the cost for each type of item) and addition (to combine the costs).'),
        ContentSection(
            type: 'paragraph',
            text:
                'For example, if you want to buy 3 notebooks at ₦150 each and 2 pens at ₦80 each, you first multiply to find each total—3 × ₦150 = ₦450 for notebooks and 2 × ₦80 = ₦160 for pens—and then add them together (₦450 + ₦160 = ₦610). Mastering these multi-step calculations helps you budget effectively and ensures you have enough money for your purchases.'),
      ],
    ),

    'Stage 5_Level 2_Numeracy': StageContent(
      cardTexts: [
        'Multiplication: Find total cost by multiplying the unit price by quantity.',
        'Division: Determine the unit price by dividing the total cost by the number of items.',
        'Unit Price Analysis: Compare cost per item to choose the best deal.',
        'Multi-Item Calculations: Combine multiplication and addition for complex purchases.',
        'Real-World Application: Use these skills to plan spending and budget effectively.'
      ],
      readingSections: [
        ContentSection(
            type: 'title',
            text: 'Mastering Multiplication, Division, and Unit Pricing'),
        ContentSection(
            type: 'paragraph',
            text:
                'In Level 3, you have learned how to use multiplication and division to solve real-world financial problems. You practiced finding total costs by multiplying unit prices by quantities and determining the cost per item by dividing the total price by the number of items.'),
        ContentSection(
            type: 'paragraph',
            text:
                'You also explored unit price analysis—comparing the price per item in different deals to determine which one is the best value. Additionally, you combined these skills to calculate the total cost in multi-item purchase scenarios, ensuring you can budget effectively.'),
        ContentSection(
            type: 'paragraph',
            text:
                'Mastery of these concepts allows you to confidently compare deals, calculate expenses, and make smart financial decisions every day.'),
      ],
    ),

    'Stage 1_Level 3_Numeracy': StageContent(
      cardTexts: [
        'Simple Interest Formula: Interest = Principal × Rate × Time.',
        'Fixed Earnings: You earn the same percentage of the original amount each period.',
        'Real-World Application: Helps you understand how savings grow with a bank account.',
        'Foundation for More: Mastering simple interest is a stepping stone to understanding compound interest.'
      ],
      readingSections: [
        ContentSection(type: 'title', text: 'Introduction to Simple Interest'),
        ContentSection(
            type: 'paragraph',
            text:
                'Interest is the extra money that banks pay you for keeping your money in a savings account. With simple interest, the calculation is straightforward: you earn a fixed percentage of the principal (the original amount you deposited) over a set period. To calculate simple interest, you use the formula:'),
        ContentSection(
            type: 'paragraph',
            text: 'Simple Interest = Principal × Rate × Time'),
        ContentSection(
            type: 'paragraph',
            text:
                'For example, if you deposit ₦1,000 at an annual interest rate of 5% (expressed as 0.05) for 1 year, your interest would be calculated as: ₦1,000 × 0.05 × 1 = ₦50'),
        ContentSection(
            type: 'paragraph',
            text:
                'This means after one year, your total amount would be the original ₦1,000 plus ₦50 in interest, totaling ₦1,050. Understanding simple interest is crucial for managing savings because it shows you how your money grows over time without the complexity of earning interest on previously earned interest.'),
      ],
    ),

    'Stage 2_Level 3_Numeracy': StageContent(
      cardTexts: [
        'Interest on Interest: Compound interest adds earned interest to the principal for future calculations.',
        'Accelerated Growth: Your savings grow faster over time as interest compounds.',
        'Formula Use: Total Amount = Principal × (1 + Rate)^Time.',
        'Real-World Impact: The earlier you start saving, the more effective compound interest becomes.'
      ],
      readingSections: [
        ContentSection(
            type: 'title', text: 'Introduction to Compound Interest'),
        ContentSection(
            type: 'paragraph',
            text:
                'Compound interest is the process where interest is earned on both the original principal and the accumulated interest from previous periods. Unlike simple interest, which is calculated solely on the principal, compound interest "compounds" over time—each period\'s interest is added to the principal, so the base for the next calculation increases.'),
        ContentSection(
            type: 'paragraph',
            text:
                'For example, if you deposit ₦1,000 at a 5% annual compound interest rate, after the first year you earn ₦50, making your new total ₦1,050. In the second year, interest is calculated on ₦1,050 rather than ₦1,000. The formula for annual compound interest is:'),
        ContentSection(
            type: 'paragraph',
            text: 'Total Amount = Principal × (1 + Rate)^Time'),
        ContentSection(
            type: 'paragraph',
            text:
                'This method accelerates the growth of your savings, especially when interest is compounded more frequently (like monthly or quarterly) or when you start saving early.'),
      ],
    ),

    'Stage 3_Level 3_Numeracy': StageContent(
      cardTexts: [
        'Real-Life Application: Use interest formulas to compare savings options.',
        'Scenario Analysis: Evaluate how changes in time and rate affect earnings.',
        'Simple vs. Compound: Understand the difference in growth between the two methods.',
        'Practical Savings: Make informed decisions on where and how long to save.'
      ],
      readingSections: [
        ContentSection(
            type: 'title',
            text: 'Applying Interest Calculations in Real-Life Savings'),
        ContentSection(
            type: 'paragraph',
            text:
                'Interest calculations are not just formulas on paper—they help you understand how your money grows over time in practical scenarios. In everyday life, you might compare different savings options to see which one benefits you more.'),
        ContentSection(
            type: 'paragraph',
            text:
                'For instance, you can compare a simple interest account with a compound interest account, or see how varying time periods affect the total amount of interest earned. By applying the formulas, you can determine which account offers better returns or how much money you can accumulate after several years.'),
        ContentSection(
            type: 'paragraph',
            text:
                'Practice by calculating interest for different principal amounts, rates, and time periods to see the real impact of saving early and letting your money work for you.'),
      ],
    ),

    'Stage 4_Level 3_Numeracy': StageContent(
      cardTexts: [
        'Time Factor: Longer investment periods yield higher interest earnings.',
        'Growth Comparison: Compound interest grows faster over time than simple interest.',
        'Early Savings: Starting early can have a major impact on your total savings.',
        'Scenario Evaluation: Comparing different timeframes shows the importance of patience in investing.'
      ],
      readingSections: [
        ContentSection(type: 'title', text: 'Comparing Savings Over Time'),
        ContentSection(
            type: 'paragraph',
            text:
                'When it comes to saving money, time plays a powerful role. With both simple and compound interest, the length of time you leave your money invested affects how much you earn. For example, with compound interest, the longer your money stays in an account, the more interest it earns—not only on your original deposit but also on the interest that accumulates over time.'),
        ContentSection(
            type: 'paragraph',
            text:
                'This means that even small amounts can grow significantly if given enough time. By comparing scenarios with different time periods, interest rates, or compounding frequencies, you can see how crucial it is to start saving early and be patient with your investments.'),
        ContentSection(
            type: 'paragraph',
            text:
                'Understanding these differences helps you choose the best savings strategy for your financial goals.'),
      ],
    ),

    'Stage 5_Level 3_Numeracy': StageContent(
      cardTexts: [
        'Simple vs. Compound Interest: Know the difference in how interest is calculated.',
        'Formulas: Simple Interest = Principal × Rate × Time; Compound Interest = Principal × (1 + Rate)^Time.',
        'Time Matters: The longer your money is invested, the more it grows.',
        'Compound Growth: Earning interest on interest accelerates savings.'
      ],
      readingSections: [
        ContentSection(type: 'title', text: 'Mastering Interest Concepts'),
        ContentSection(
            type: 'paragraph',
            text:
                'In Level 4, you explored the fundamentals of interest and its role in growing your savings. You learned that simple interest is calculated only on the original principal using the formula: Simple Interest = Principal × Rate × Time'),
        ContentSection(
            type: 'paragraph',
            text:
                'In contrast, compound interest calculates interest on both the original principal and the accumulated interest over time, following the formula: Total Amount = Principal × (1 + Rate)^Time'),
        ContentSection(
            type: 'paragraph',
            text:
                'These concepts illustrate how your money can grow over time—especially when interest is compounded, meaning you earn interest on interest. By comparing different scenarios, you\'ve seen that longer time periods and higher compounding frequencies significantly boost your savings.'),
        ContentSection(
            type: 'paragraph',
            text:
                'Understanding these principles helps you make informed decisions about savings accounts and long-term investments.'),
      ],
    ),

    'Stage 1_Level 4_Numeracy': StageContent(
      cardTexts: [
        'Income Allocation: Divide your income among needs, wants, and savings.',
        'The 50/30/20 Rule: A popular method for budgeting.',
        'Expense Forecasting: List fixed and variable expenses.',
        'Financial Planning: Use math to ensure spending aligns with income and goals.'
      ],
      readingSections: [
        ContentSection(
            type: 'title', text: 'Introduction to Budgeting with Math'),
        ContentSection(
            type: 'paragraph',
            text:
                'Budgeting is a powerful tool that uses math to help you plan how to spend and save your money. By creating a budget, you can break down your income into categories such as needs, wants, and savings.'),
        ContentSection(
            type: 'paragraph',
            text:
                'For example, a common method is the 50/30/20 rule: 50% of your income goes toward essentials (needs), 30% toward non-essentials (wants), and 20% toward savings. To create a budget, you start by calculating your total income, listing your fixed and variable expenses, and then determining how much money remains for savings or extra spending.'),
        ContentSection(
            type: 'paragraph',
            text:
                'This process helps you understand where every Naira goes and ensures you have enough for your financial goals.'),
      ],
    ),

    'Stage 2_Level 4_Numeracy': StageContent(
      cardTexts: [
        'Expense Forecasting: Estimate fixed and variable expenses based on past spending.',
        'Realistic Planning: Adjust your estimates for anticipated changes.',
        'Budget Balance: Ensure you have funds for essential needs, savings, and discretionary spending.',
        'Financial Control: Accurate forecasting helps avoid overspending and supports informed decision-making.'
      ],
      readingSections: [
        ContentSection(
            type: 'title', text: 'Forecasting and Managing Expenses'),
        ContentSection(
            type: 'paragraph',
            text:
                'Forecasting expenses is a critical step in budgeting. It involves estimating both your fixed expenses (like rent, utilities, or school fees) and variable expenses (such as groceries, transportation, or entertainment).'),
        ContentSection(
            type: 'paragraph',
            text:
                'To forecast your expenses, start by reviewing your past spending patterns, then adjust for any anticipated changes. This process helps you plan realistically, ensuring you have enough funds for essential needs while setting aside money for savings and discretionary spending.'),
        ContentSection(
            type: 'paragraph',
            text:
                'By accurately forecasting expenses, you can avoid overspending and make informed decisions about where to allocate your income.'),
      ],
    ),

    'Stage 3_Level 4_Numeracy': StageContent(
      cardTexts: [
        'Total Income: Start by determining your monthly income.',
        'Fixed vs. Variable Expenses: Identify and list expenses that are constant and those that vary.',
        'Expense Summation: Add fixed and variable expenses to get the overall expense.',
        'Calculate Remaining Funds: Subtract total expenses from income to see what\'s left.',
        'Allocation: Use the remaining funds for savings and extra spending.'
      ],
      readingSections: [
        ContentSection(type: 'title', text: 'Creating a Budget Step-by-Step'),
        ContentSection(
            type: 'paragraph',
            text:
                'Creating a budget involves a systematic approach to organizing your money. First, determine your total monthly income. Next, list your fixed expenses such as rent, utilities, and subscriptions—costs that remain constant every month.'),
        ContentSection(
            type: 'paragraph',
            text:
                'Then, estimate your variable expenses, which can change from month to month, such as groceries, transportation, and entertainment. Once you have the totals for both fixed and variable expenses, add them together to find your overall expenses.'),
        ContentSection(
            type: 'paragraph',
            text:
                'Subtract your total expenses from your income to discover your remaining funds. Finally, decide how to allocate this remaining balance among savings and discretionary spending. This step-by-step process helps ensure that every naira is accounted for and that you are better prepared to meet your financial goals.'),
      ],
    ),

    'Stage 4_Level 4_Numeracy': StageContent(
      cardTexts: [
        'Flexibility: A good budget adapts to changes in income and expenses.',
        'Review & Update: Regularly check your income and expense estimates.',
        'Reallocation: Shift funds among categories as needed.',
        'Financial Stability: Adjustments ensure your budget remains balanced over time.',
        'Practical Application: Learn to respond to real-life financial changes.'
      ],
      readingSections: [
        ContentSection(
            type: 'title',
            text: 'Adjusting Your Budget for Changing Circumstances'),
        ContentSection(
            type: 'paragraph',
            text:
                'A budget isn\'t set in stone—it should be flexible and adapt to changes in your income or expenses. Over time, you might experience fluctuations in your monthly earnings, or your expenses may increase due to unforeseen costs.'),
        ContentSection(
            type: 'paragraph',
            text:
                'When this happens, adjusting your budget is essential to maintain financial balance. Start by reviewing your current income and expense estimates, then update the figures for any changes. Reassess your priorities and reallocate funds to ensure your needs are met while still setting aside money for savings.'),
        ContentSection(
            type: 'paragraph',
            text:
                'These adjustments help you remain in control of your finances even when circumstances change.'),
      ],
    ),

    'Stage 5_Level 4_Numeracy': StageContent(
      cardTexts: [
        'Income Calculation: Begin with your total monthly income.',
        'Expense Identification: Separate expenses into fixed and variable.',
        'Expense Summation: Add fixed and variable expenses to determine total spending.',
        'Remaining Funds: Subtract expenses from income to find funds available for savings or extras.',
        'Budget Adjustments: Revise your budget based on changes in income or expenses.'
      ],
      readingSections: [
        ContentSection(type: 'title', text: 'Mastering Budgeting with Math'),
        ContentSection(
            type: 'paragraph',
            text:
                'In Level 5, you learned how to use math to create and manage a budget. A well-designed budget starts with knowing your total monthly income. Then, you identify your fixed expenses (such as rent and utilities) and variable expenses (like groceries and entertainment).'),
        ContentSection(
            type: 'paragraph',
            text:
                'By adding these together, you determine your overall expenses. Subtracting your total expenses from your income reveals your remaining funds, which you can allocate to savings or discretionary spending.'),
        ContentSection(
            type: 'paragraph',
            text:
                'You also learned how to forecast future expenses based on past spending patterns and how to adjust your budget when your income or expenses change. Mastering these techniques helps you plan effectively and make informed financial decisions.'),
      ],
    ),

    // SAVINGS CONTENT - All Levels

    'Stage 1_Level 0_Savings': StageContent(
      cardTexts: [
        'Needs = Essential for living or learning',
        'Wants = Extra things we enjoy but don\'t need',
        'Wise Spending = Prioritize needs → Save → Spend on wants if you can',
      ],
      readingSections: [
        ContentSection(type: 'title', text: 'Needs vs Wants'),
        ContentSection(
            type: 'paragraph',
            text:
                'When you get money, it\'s important to know what to use it for. Some things are needs — things you must have to live, learn, and stay healthy, like food, shelter, and school supplies.'),
        ContentSection(
            type: 'paragraph',
            text:
                'Other things are wants — things you enjoy or wish for, but don\'t absolutely need, like toys, sweets, or new clothes when you already have enough.'),
        ContentSection(
            type: 'paragraph',
            text:
                'Spending wisely means taking care of your needs first, then saving some money, and only using the rest for wants if possible.'),
        ContentSection(type: 'subtitle', text: 'Highlights:'),
        ContentSection(type: 'list', items: [
          'Needs = Essential for living or learning',
          'Wants = Extra things we enjoy but don\'t need',
          'Wise Spending = Prioritize needs → Save → Spend on wants if you can',
        ]),
      ],
    ),
    'Stage 2_Level 0_Savings': StageContent(
      cardTexts: [
        'Saving helps you handle emergencies, reach goals, and feel more prepared',
        'Start saving early and regularly, even in small amounts',
        'Saving gives you choices later that you may not have if you spend everything now',
      ],
      readingSections: [
        ContentSection(type: 'title', text: 'Why We Save Money'),
        ContentSection(
            type: 'paragraph',
            text:
                'Saving means keeping some of your money instead of spending it all. But why should you save?'),
        ContentSection(
            type: 'paragraph',
            text:
                'People save:\n• To be ready for unexpected needs like a broken sandal or emergency\n• To reach goals like buying a book or bicycle\n• To avoid stress when something important comes up'),
        ContentSection(
            type: 'paragraph',
            text:
                'Saving also gives you freedom to choose later and helps avoid borrowing. Even if it\'s just a little, saving something regularly builds a habit that can grow over time.'),
        ContentSection(type: 'subtitle', text: 'Highlights:'),
        ContentSection(type: 'list', items: [
          'Saving helps you handle emergencies, reach goals, and feel more prepared',
          'Start saving early and regularly, even in small amounts',
          'Saving gives you choices later that you may not have if you spend everything now',
        ]),
      ],
    ),
    'Stage 3_Level 0_Savings': StageContent(
      cardTexts: [
        'Save First, Spend Later – Build strong financial habits.',
        'Secure Saving Methods – Use banks, apps, or piggy banks.',
        'Avoid Poor Methods – Don’t leave money in your wallet.',
        'Set Clear Goals – Know what you’re saving for.',
        'Track Progress – Stay motivated and disciplined.',
        'Golden Rule – Always save before spending.'
      ],
      readingSections: [
        ContentSection(type: 'title', text: 'What is Saving?'),
        ContentSection(
            type: 'paragraph',
            text:
                'Saving money is an important habit that helps you prepare for future needs. Choosing the right saving method keeps your money safe and helps it grow over time.'),
        ContentSection(type: 'subtitle', text: 'Good Saving Methods:'),
        ContentSection(
            type: 'dropdown',
            header: 'Bank Savings Accounts',
            body: 'Protect your money and earn interest.'),
        ContentSection(
            type: 'dropdown',
            header: 'Savings Apps',
            body: 'Automate and track savings easily.'),
        ContentSection(
            type: 'dropdown',
            header: 'Piggy Banks',
            body: 'Useful for short-term savings (less secure than banks).'),
        ContentSection(type: 'subtitle', text: 'Poor Saving Methods:'),
        ContentSection(
            type: 'dropdown',
            header: 'Leaving Money in Wallet',
            body: 'Makes it easy to spend instead of save.'),
        ContentSection(
            type: 'dropdown',
            header: 'Spending First, Saving Later',
            body: 'Often leaves nothing to save.'),
        ContentSection(
            type: 'paragraph',
            text:
                'Golden Rule: Always save first before spending to develop good financial habits.'),
      ],
    ),

    'Stage 4_Level 0_Savings': StageContent(
      cardTexts: [
        'Set Clear Goals – Know what you’re saving for.',
        'Calculate the Amount – Determine how much you need.',
        'Choose a Deadline – Set a timeline to stay focused.',
        'Save Regularly – Consistency is key, even with small amounts.',
        'Avoid Impulse Spending – Stick to your plan.',
        'Track Progress – Stay motivated by monitoring savings.'
      ],
      readingSections: [
        ContentSection(type: 'title', text: 'Savings Goals & Discipline'),
        ContentSection(
            type: 'paragraph',
            text:
                'Setting a savings goal helps you stay focused and disciplined. When you know what you’re saving for, it’s easier to avoid unnecessary spending.'),
        ContentSection(type: 'subtitle', text: 'Steps to Set a Savings Goal:'),
        ContentSection(type: 'list', items: [
          'Decide what you want to save for (e.g., bike, gift).',
          'Figure out how much you need.',
          'Choose a deadline to reach your goal.',
          'Save regularly, even small amounts.'
        ]),
        ContentSection(type: 'subtitle', text: 'Good Habits:'),
        ContentSection(
            type: 'dropdown',
            header: 'Tracking Progress',
            body: 'Keeps you motivated and on track.'),
        ContentSection(
            type: 'dropdown',
            header: 'Avoiding Impulse Spending',
            body: 'Prevents derailing your savings plan.'),
        ContentSection(
            type: 'paragraph', text: 'Pro Tip: Always save with a purpose!'),
      ],
    ),

    'Stage 5_Level 0_Savings': StageContent(
      cardTexts: [
        'Record Earnings – Track allowances, gifts, or income.',
        'Log Expenses – Note every purchase, no matter how small.',
        'Compare Income vs. Spending – Ensure you’re saving enough.',
        'Adjust Budget – Cut back if needed.',
        'Use Tools – Notebooks, apps, or bank statements.',
        'Prevent Overspending – Stay within limits.'
      ],
      readingSections: [
        ContentSection(type: 'title', text: 'Tracking Your Money'),
        ContentSection(
            type: 'paragraph',
            text:
                'Tracking your money helps you understand where it goes and make smarter financial decisions. Without tracking, you might overspend and struggle to save.'),
        ContentSection(type: 'subtitle', text: 'Why Tracking Matters:'),
        ContentSection(
            type: 'dropdown',
            header: 'Avoid Running Out of Money',
            body: 'Prevents unexpected shortages.'),
        ContentSection(
            type: 'dropdown',
            header: 'Identify Savings Opportunities',
            body: 'Shows where to cut back.'),
        ContentSection(
            type: 'dropdown',
            header: 'Reach Goals Faster',
            body: 'Helps you stay on track.'),
        ContentSection(type: 'subtitle', text: 'How to Track Money:'),
        ContentSection(type: 'list', items: [
          'Write down earnings and expenses.',
          'Use a notebook, app, or receipts.',
          'Compare savings vs. spending weekly.',
          'Adjust your budget if needed.'
        ]),
        ContentSection(
            type: 'paragraph',
            text:
                'Did You Know? People who track money save 20% more on average!'),
      ],
    ),

    // Level 2 - Tracking Basics (Quiz 1)
    'Stage 1_Level 1_Savings': StageContent(
      cardTexts: [
        'Tracking your money means keeping a record of what you earn and spend.',
        'Ways to track your money include using a journal, expense tracker, receipts, or setting a budget.',
        'Checking your balance before spending helps avoid overspending.',
        'Tracking money helps you save by showing where you can cut back.',
        'Being aware of your spending helps you reach your financial goals faster.'
      ],
      readingSections: [
        ContentSection(type: 'title', text: 'Tracking Your Money'),
        ContentSection(
            type: 'paragraph',
            text:
                'Keeping track of your money helps you understand where your money goes and how to make smarter financial decisions. If you don\'t track your money, you may end up spending more than you realize, leaving little or nothing for savings or important expenses.'),
        ContentSection(type: 'subtitle', text: 'Ways to Track Your Money:'),
        ContentSection(type: 'list', items: [
          'Writing it down: Keeping a journal or using a notebook to record what you earn and spend.',
          'Using an expense tracker: Apps or simple spreadsheets help you track spending easily.',
          'Keeping receipts: Checking receipts lets you see exactly what you spent and where.',
          'Setting a budget: Planning how much to spend and save each time you receive money.',
          'Checking your balance regularly: Knowing how much money you have before spending helps prevent overspending.'
        ]),
        ContentSection(type: 'subtitle', text: 'Why It\'s Important:'),
        ContentSection(type: 'list', items: [
          'Helps you avoid running out of money unexpectedly.',
          'Makes it easier to save for things you want by showing where you can cut back.',
          'Helps you see your progress toward your savings goals.'
        ]),
        ContentSection(
            type: 'paragraph',
            text:
                'By tracking your money, you take control of your finances and make better decisions about spending and saving!')
      ],
    ),

// Level 2 - Tracking Steps (Quiz 2)
    'Stage 2_Level 1_Savings': StageContent(
      cardTexts: [
        'Tracking your money helps you manage what you earn, spend, and save.',
        'Follow these steps: Write down your earnings → Record your spending → Compare savings and expenses → Adjust your budget.',
        'Different tools like notebooks, budget apps, and bank statements help track money.',
        'Checking your income vs. expenses regularly ensures you save enough.',
        'Good tracking habits help you make smarter financial decisions!'
      ],
      readingSections: [
        ContentSection(type: 'title', text: 'How to Track Your Money'),
        ContentSection(
            type: 'paragraph',
            text:
                'Tracking your money means keeping an organized record of what you earn, spend, and save. This helps you manage your finances better and avoid running out of money unexpectedly.'),
        ContentSection(type: 'subtitle', text: 'Steps to Track Your Money:'),
        ContentSection(type: 'numbered_list', items: [
          'Write down what you earn - Keep track of any money you receive, such as allowances, gifts, or earnings.',
          'Record what you spend - Note every expense, no matter how small, to see where your money is going.',
          'Compare your savings and spending - Check if you are saving enough and if you need to adjust your spending habits.',
          'Adjust your budget if needed - If you\'re spending too much, find areas to cut back and save more.'
        ]),
        ContentSection(
            type: 'subtitle', text: 'Tools to Help You Track Money:'),
        ContentSection(type: 'list', items: [
          'Notebook - A simple way to write down earnings and expenses.',
          'Budget apps - Digital tools that help track money automatically.',
          'Piggy bank - A great way to store small savings.',
          'Bank statements - If you have a bank account, these show all your transactions.'
        ]),
        ContentSection(
            type: 'subtitle', text: 'Why Tracking Your Money Matters:'),
        ContentSection(type: 'list', items: [
          'Helps you stay in control of your finances.',
          'Makes it easier to save for important goals.',
          'Prevents overspending and keeps you on budget.'
        ]),
        ContentSection(
            type: 'paragraph',
            text:
                'By tracking your money regularly, you can make smarter financial choices and reach your savings goals faster!')
      ],
    ),

// Level 2 - Budget Integration (Quiz 3)
    'Stage 3_Level 1_Savings': StageContent(
      cardTexts: [
        'Tracking spending + budgeting = Better money management.',
        'Tracking helps identify habits, prevent overspending, and encourage saving.',
        'Good budgeting habits: Check spending, adjust when needed, and set limits.',
        'A budget includes four key categories: Needs, Wants, Savings, and Giving.',
        'If you spend more than you earn, you may end up in debt.'
      ],
      readingSections: [
        ContentSection(type: 'title', text: 'Budgeting & Tracking Together'),
        ContentSection(
            type: 'paragraph',
            text:
                'Tracking your spending and budgeting go hand in hand. When you track your money, you see where it\'s going, and budgeting helps you decide how to spend it wisely. A good budget ensures you don\'t run out of money while still saving for important goals.'),
        ContentSection(
            type: 'subtitle', text: 'How Tracking Helps with Budgeting:'),
        ContentSection(type: 'list', items: [
          'Identifies spending habits - Helps you see where your money is going.',
          'Prevents overspending - Keeps you from spending more than you earn.',
          'Encourages saving - Helps you set aside money for future goals.',
          'Allows budget adjustments - If you notice a problem, you can fix it early.'
        ]),
        ContentSection(type: 'subtitle', text: 'Key Budgeting Habits:'),
        ContentSection(type: 'list', items: [
          'Check your spending regularly - Weekly reviews help you stay on track.',
          'Adjust your budget when needed - If you\'re spending too much, make changes.',
          'Set spending limits - Decide how much to spend on needs, wants, and savings.'
        ]),
        ContentSection(type: 'subtitle', text: 'Budget Categories:'),
        ContentSection(type: 'list', items: [
          'Needs - Essential expenses like food, rent, and school fees.',
          'Wants - Non-essential expenses like toys, entertainment, and snacks.',
          'Savings - Money set aside for future goals or emergencies.',
          'Giving - Donating or helping others with money.'
        ]),
        ContentSection(
            type: 'paragraph',
            text:
                'If you spend more than you earn, you can end up in debt, which means owing money to others. But if you track your spending and budget wisely, you can save, plan, and avoid financial stress!')
      ],
    ),

// Level 2 - Smart Spending (Quiz 4)
    'Stage 4_Level 1_Savings': StageContent(
      cardTexts: [
        'Tracking + budgeting = smart money habits.',
        'Smart spending means thinking before buying and checking your budget.',
        'Impulse spending is buying things you don\'t really need.',
        'Good habits: Plan purchases, record expenses, set limits, and review weekly.',
        'Your budget has Needs, Wants, Savings, and Giving.',
        'Spending more than you earn can lead to debt.'
      ],
      readingSections: [
        ContentSection(type: 'title', text: 'Smart Spending & Tracking'),
        ContentSection(
            type: 'paragraph',
            text:
                'Tracking your spending helps you see where your money goes. Budgeting helps you plan how to use it. Together, they stop you from overspending and help you save.'),
        ContentSection(type: 'subtitle', text: 'Smart Spending Tips:'),
        ContentSection(type: 'list', items: [
          'Think before you buy—ask if you really need it.',
          'Check your budget before big purchases.',
          'Record your expenses to stay on track.',
          'Set limits for needs, wants, savings, and giving.'
        ]),
        ContentSection(
            type: 'paragraph',
            text:
                'If you spend more than you earn, you can end up in debt. But with smart spending and tracking, you stay in control.')
      ],
    ),

// Level 2 - Tracking Mastery (Quiz 5)
    'Stage 5_Level 1_Savings': StageContent(
      cardTexts: [
        'Tracking your money helps you see where it goes and avoid overspending.',
        'Good money habits: Write down spending, track savings, and set a budget.',
        'Use tracking tools like notebooks, apps, piggy banks, and bank statements.',
        'Budgeting helps manage money and prevent debt.',
        'A budget includes Needs, Wants, Savings, and Giving.',
        'Checking income vs. expenses regularly keeps you financially stable.'
      ],
      readingSections: [
        ContentSection(type: 'title', text: 'Tracking Your Money & Budgeting'),
        ContentSection(
            type: 'paragraph',
            text:
                'Understanding how to track your money and use a budget helps you stay in control of your finances, avoid overspending, and reach your savings goals.'),
        ContentSection(
            type: 'subtitle', text: 'Why Tracking and Budgeting Matter'),
        ContentSection(
            type: 'paragraph',
            text:
                'Tracking your money shows where it goes and helps you make better choices. It supports good habits like writing down spending, watching your savings grow, and sticking to a budget. Without tracking, it\'s easy to overspend and hard to save.'),
        ContentSection(type: 'subtitle', text: 'How to Track Your Money'),
        ContentSection(
            type: 'paragraph',
            text:
                'Record what you earn and spend. Check your progress often using tools like a notebook, budget app, piggy bank, or bank statement.'),
        ContentSection(
            type: 'subtitle',
            text: 'Budgeting + Tracking = Smart Money Management'),
        ContentSection(
            type: 'paragraph',
            text:
                'Tracking helps you adjust your budget and save more. Good habits include reviewing spending weekly, setting limits, and updating your budget when needed. Spending more than you earn can lead to debt.'),
        ContentSection(type: 'subtitle', text: '4 Key Budget Categories:'),
        ContentSection(type: 'list', items: [
          'Needs – Essentials (e.g., food, rent, school fees)',
          'Wants – Extras (e.g., toys, snacks, entertainment)',
          'Savings – For future goals and emergencies',
          'Giving – Helping others'
        ])
      ],
    ),

// Level 3 - Smart Spending (Quiz 1)
    'Stage 1_Level 2_Savings': StageContent(
      cardTexts: [
        'Smart spending means thinking before you buy.',
        'Steps for smart spending: Think → Check budget → Compare prices → Decide if worth it.',
        'Plan purchases and avoid impulse buying.',
        'Checking prices helps you find better deals.',
        'Making wise spending choices helps you save money for important things.'
      ],
      readingSections: [
        ContentSection(type: 'title', text: 'Spending Wisely'),
        ContentSection(
            type: 'paragraph',
            text:
                'Making smart spending choices helps you save money and avoid unnecessary purchases. Before you buy something, take time to think and make sure it\'s a wise decision.'),
        ContentSection(type: 'subtitle', text: 'How to Spend Money Wisely'),
        ContentSection(type: 'list', items: [
          'Think before you buy: Ask yourself if you really need the item.',
          'Compare prices: Look at different options to find the best deal.',
          'Check your budget: Make sure you have enough money before spending.',
          'Decide if it\'s worth the cost: Some things are wants, not needs—spend carefully!'
        ]),
        ContentSection(type: 'subtitle', text: 'Smart Spending Habits'),
        ContentSection(type: 'list', items: [
          'Planning purchases instead of buying on impulse',
          'Checking prices before making a decision',
          'Making sure you can afford it before buying'
        ]),
        ContentSection(type: 'subtitle', text: 'Not-So-Smart Spending Habits'),
        ContentSection(type: 'list', items: [
          'Spending all your money at once without thinking ahead',
          'Buying things just because others have them',
          'Ignoring your budget and overspending'
        ]),
        ContentSection(
            type: 'subtitle',
            text: 'Why Thinking Before You Spend is Important'),
        ContentSection(type: 'list', items: [
          'It helps you avoid wasting money on things you don\'t need.',
          'It allows you to save for bigger, more important goals.',
          'It teaches you good money habits that will help you in the future.'
        ])
      ],
    ),

// Level 3 - Avoiding Impulse Buying (Quiz 2)
    'Stage 2_Level 2_Savings': StageContent(
      cardTexts: [
        'Impulse buying is spending money without planning.',
        'Sales and ads can tempt you to buy things you don\'t need.',
        'Shopping lists and budgets help you stay in control.',
        'Waiting before buying helps avoid regret.',
        'Smart spending means making careful, planned choices.'
      ],
      readingSections: [
        ContentSection(type: 'title', text: 'Avoiding Impulse Buying'),
        ContentSection(
            type: 'paragraph',
            text:
                'Impulse buying happens when you buy something suddenly without thinking about whether you really need it or can afford it. It often leads to overspending, wasting money, and sometimes regret. Marketers and stores use tricks like sales, flashy advertisements, and limited-time offers to make people feel like they must buy something right away. However, smart money management means controlling your spending instead of letting your emotions or outside pressure decide for you.'),
        ContentSection(type: 'subtitle', text: 'Ways to Avoid Impulse Buying:'),
        ContentSection(type: 'numbered_list', items: [
          'Make a shopping list before you go shopping and stick to it.',
          'Set a budget to limit how much you plan to spend.',
          'Wait before buying—use the 24-hour rule!',
          'Ignore peer pressure—stick to your own budget.',
          'Compare prices before making a purchase.'
        ]),
        ContentSection(
            type: 'paragraph',
            text:
                'By following these steps, you can spend wisely, avoid running out of money too quickly, and save for things that truly matter.')
      ],
    ),

// Level 3 - Value for Money (Quiz 3)
    'Stage 3_Level 2_Savings': StageContent(
      cardTexts: [
        'Value for money means balancing price and quality.',
        'Cheap but low-quality items may cost more over time.',
        'Check reviews and compare options before buying.',
        'Sales don\'t always mean good value—only buy what you need.',
        'Smart spending means choosing durable, useful items.'
      ],
      readingSections: [
        ContentSection(type: 'title', text: 'Understanding Value for Money'),
        ContentSection(
            type: 'paragraph',
            text:
                'Getting value for money means making sure that what you buy is worth the price you pay. It\'s not always about choosing the cheapest or the most expensive item but about finding the best balance between price and quality. A product that costs less but breaks quickly may end up costing more in the long run because you have to replace it often. On the other hand, a high-quality product that lasts a long time may be worth a slightly higher price.'),
        ContentSection(
            type: 'subtitle', text: 'How to Get the Best Value for Money:'),
        ContentSection(type: 'list', items: [
          'Compare price and quality before buying',
          'Check reviews and recommendations',
          'Avoid buying just because of a sale',
          'Think about long-term use',
          'Spend wisely on quality at reasonable prices'
        ]),
        ContentSection(
            type: 'paragraph',
            text:
                'By making smart choices, you can save money while still getting the best products for your needs.')
      ],
    ),

// Level 3 - Spending Plan (Quiz 4)
    'Stage 4_Level 2_Savings': StageContent(
      cardTexts: [
        'A spending plan helps you manage money wisely.',
        'Plan for important expenses first, then save before spending on extras.',
        'Without a plan, you may overspend or struggle to save.',
        'Good planning means saving before spending and checking your budget.',
        'A smart spending plan helps you stay in control of your finances.'
      ],
      readingSections: [
        ContentSection(type: 'title', text: 'Making a Spending Plan'),
        ContentSection(
            type: 'paragraph',
            text:
                'A spending plan helps you manage your money wisely. It ensures you have enough for important needs while still allowing for savings and fun spending. Without a plan, you might run out of money too quickly or struggle to save.'),
        ContentSection(
            type: 'subtitle', text: 'Steps to Make a Spending Plan:'),
        ContentSection(type: 'numbered_list', items: [
          'Know how much money you have - Start by checking your total income, allowance, or savings.',
          'Plan for important expenses first - These could be school supplies, transportation, or food.',
          'Set aside savings - Always save a little before spending on extras.',
          'Use what\'s left for fun spending - If there\'s extra, you can enjoy small treats or entertainment.'
        ]),
        ContentSection(
            type: 'paragraph',
            text:
                'A good spending plan helps you avoid overspending, prepare for future needs, and stay in control of your money.')
      ],
    ),

// Level 3 - Smart Money Management (Quiz 5)
    'Stage 5_Level 2_Savings': StageContent(
      cardTexts: [
        'Think before spending - Compare prices and check quality.',
        'Avoid impulse buying - Plan your purchases and stick to a list.',
        'Get value for money - Quality + price = good deal.',
        'Use a spending plan - Prioritize needs, save, and then spend.',
        'Smart money habits help you save more and spend wisely.'
      ],
      readingSections: [
        ContentSection(
            type: 'title', text: 'Smart Spending & Money Management'),
        ContentSection(
            type: 'paragraph',
            text:
                'Being smart with your money means planning before you spend, avoiding impulse purchases, getting good value, and creating a spending plan.'),
        ContentSection(type: 'subtitle', text: '1. Spending Wisely'),
        ContentSection(
            type: 'paragraph',
            text:
                'Think before you buy. Compare prices, check quality, and avoid spending just because others are. Smart spending helps you save money and make better choices.'),
        ContentSection(type: 'subtitle', text: '2. Avoiding Impulse Buying'),
        ContentSection(
            type: 'paragraph',
            text:
                'Impulse buying happens when you buy something without planning. To avoid this, make a shopping list, set spending limits, and think before you purchase.'),
        ContentSection(
            type: 'subtitle', text: '3. Understanding Value for Money'),
        ContentSection(
            type: 'paragraph',
            text:
                'The best deal isn\'t always the cheapest. Look for quality and price together. A product that lasts longer is better value than a cheap one that breaks quickly.'),
        ContentSection(type: 'subtitle', text: '4. Making a Spending Plan'),
        ContentSection(
            type: 'paragraph',
            text:
                'A good spending plan ensures you cover important expenses first, save some money, and then spend on extras. This keeps you in control and helps you avoid financial stress.')
      ],
    ),

    'Stage 1_Level 3_Savings': StageContent(
      cardTexts: [
        'Save first, spend later to avoid running out of money.',
        'Set a savings goal and keep savings separate from spending money.',
        'Use the 50/30/20 rule as a simple guide for managing income.',
        'Track your savings progress to stay on top of your finances.',
        'Impulse spending can hurt savings—plan purchases wisely.',
        'Saving before spending builds financial security and smart money habits.',
      ],
      readingSections: [
        ContentSection(
            type: 'title', text: 'Why Saving Before Spending is Important'),
        ContentSection(
            type: 'paragraph',
            text:
                'Saving money before spending helps you stay in control of your finances. It ensures you have enough for important needs, prevents you from running out of money, and helps you achieve your financial goals. If you spend first and save later, you might not have anything left to put aside for the future.'),
        ContentSection(
            type: 'paragraph',
            text:
                'When you make saving a priority, you build financial security and develop good money habits. It helps you prepare for unexpected expenses, avoid unnecessary debt, and make better financial decisions. Saving before spending also teaches discipline and encourages a long-term mindset about money.'),
        ContentSection(type: 'subtitle', text: 'To save before spending:'),
        ContentSection(
            type: 'dropdown',
            header: '1. Decide how much to save',
            body:
                'Set a percentage or a fixed amount to save regularly. A good rule of thumb is the 50/30/20 rule, where you allocate 50% of your income for needs, 30% for wants, and at least 20% for savings.'),
        ContentSection(
            type: 'dropdown',
            header: '2. Set aside your savings',
            body:
                'Keep your savings separate from your everyday spending money. You can use a savings account or a special savings wallet to avoid temptation.'),
        ContentSection(
            type: 'dropdown',
            header: '3. Spend what\'s left',
            body:
                'After setting aside savings, use the remaining money for your essential expenses and planned purchases.'),
        ContentSection(
            type: 'dropdown',
            header: '4. Track your savings',
            body:
                'Monitor your savings regularly to see if you are meeting your goals. Adjust your budget if necessary to stay on track.'),
        ContentSection(
            type: 'dropdown',
            header: '5. Avoid impulse spending',
            body:
                'Think carefully before making purchases. Ask yourself, "Do I really need this?" or "Is this more important than my savings goal?"'),
        ContentSection(type: 'subtitle', text: 'Highlights:'),
        ContentSection(type: 'list', items: [
          'Save first, spend later to avoid running out of money.',
          'Set a savings goal and keep savings separate from spending money.',
          'Use the 50/30/20 rule as a simple guide for managing income.',
          'Track your savings progress to stay on top of your finances.',
          'Impulse spending can hurt savings—plan purchases wisely.',
          'Saving before spending builds financial security and smart money habits.',
        ]),
      ],
    ),

    'Stage 2_Level 3_Savings': StageContent(
      cardTexts: [
        'Earning money requires effort — it\'s not the same as receiving a gift.',
        'Ways to earn include chores, selling products, and providing services.',
        'Entrepreneurs make money by selling things or offering services.',
        'Passive income lets you earn even when not working.',
        'Earning money helps build responsibility and financial independence.',
      ],
      readingSections: [
        ContentSection(type: 'title', text: 'Different Ways to Earn Money'),
        ContentSection(
            type: 'paragraph',
            text:
                'Earning money helps you become independent and responsible. Unlike receiving money as a gift, earning means working for it, which teaches the value of hard work and smart money management.'),
        ContentSection(
            type: 'paragraph',
            text:
                'Kids and teens can earn money in different ways, depending on their skills and interests. Some require active effort, while others can generate long-term income.'),
        ContentSection(type: 'subtitle', text: 'Ways to Earn Money:'),
        ContentSection(
            type: 'dropdown',
            header: 'Doing chores at home',
            body: 'Helping with extra tasks for an allowance.'),
        ContentSection(
            type: 'dropdown',
            header: 'Providing services',
            body: 'Babysitting, tutoring, washing cars, or helping neighbors.'),
        ContentSection(
            type: 'dropdown',
            header: 'Selling products',
            body: 'Making and selling crafts, snacks, or reselling items.'),
        ContentSection(
            type: 'dropdown',
            header: 'Using technology',
            body:
                'Selling digital content, designs, or offering online tutoring.'),
        ContentSection(
            type: 'dropdown',
            header: 'Passive income',
            body:
                'Earning from something long-term, like an online store or digital products.'),
        ContentSection(type: 'subtitle', text: 'Highlights:'),
        ContentSection(type: 'list', items: [
          'Earning money requires effort — it\'s not the same as receiving a gift.',
          'Ways to earn include chores, selling products, and providing services.',
          'Entrepreneurs make money by selling things or offering services.',
          'Passive income lets you earn even when not working.',
          'Earning money helps build responsibility and financial independence.',
        ]),
      ],
    ),

    'Stage 3_Level 3_Savings': StageContent(
      cardTexts: [
        'A savings goal is a clear plan for saving money.',
        'Short-term goals take weeks or months; long-term goals take years.',
        'Setting a savings goal helps avoid impulse spending.',
        'Tracking progress keeps you motivated and on track.',
        'A specific savings goal makes saving easier and more achievable.',
      ],
      readingSections: [
        ContentSection(
            type: 'title', text: 'Setting Savings Goals Before Spending'),
        ContentSection(
            type: 'paragraph',
            text:
                'Setting a savings goal before spending helps you manage money wisely and avoid unnecessary purchases. A savings goal is a specific amount of money you plan to save for something important.'),
        ContentSection(type: 'subtitle', text: 'Steps to Set a Savings Goal:'),
        ContentSection(
            type: 'dropdown',
            header: '1. Decide what you want to save for',
            body: 'It could be a toy, a bicycle, or future education.'),
        ContentSection(
            type: 'dropdown',
            header: '2. Set a specific amount',
            body: 'Know exactly how much you need.'),
        ContentSection(
            type: 'dropdown',
            header: '3. Make a savings plan',
            body: 'Choose how much to save regularly.'),
        ContentSection(
            type: 'dropdown',
            header: '4. Track your progress',
            body: 'Adjust your plan if needed.'),
        ContentSection(type: 'subtitle', text: 'Highlights:'),
        ContentSection(type: 'list', items: [
          'A savings goal is a clear plan for saving money.',
          'Short-term goals take weeks or months; long-term goals take years.',
          'Setting a savings goal helps avoid impulse spending.',
          'Tracking progress keeps you motivated and on track.',
          'A specific savings goal makes saving easier and more achievable.',
        ]),
      ],
    ),

    'Stage 4_Level 3_Savings': StageContent(
      cardTexts: [
        'Active income = Work for money. Passive income = Money earned with little effort.',
        'Active income examples: Jobs, chores, selling products.',
        'Passive income examples: Interest, rental payments, royalties.',
        'Passive income can help you earn money while you sleep.',
        'Starting with active income can lead to passive income opportunities.',
      ],
      readingSections: [
        ContentSection(type: 'title', text: 'Active vs. Passive Income'),
        ContentSection(
            type: 'paragraph',
            text:
                'Understanding how money is earned helps you plan for the future. Active income requires you to work to earn money, while passive income is earned with little to no effort once it\'s set up.'),
        ContentSection(
            type: 'subtitle', text: 'Examples of Active and Passive Income:'),
        ContentSection(
            type: 'dropdown',
            header: 'Active Income',
            body:
                'Comes from jobs or services where you work for pay, like doing chores, selling crafts, or having a part-time job.'),
        ContentSection(
            type: 'dropdown',
            header: 'Passive Income',
            body:
                'Comes from sources that don\'t require ongoing work, like earning interest from savings, rental income, or royalties from books.'),
        ContentSection(
            type: 'paragraph',
            text:
                'Building passive income over time can help you earn money even when you\'re not actively working, but most people start with active income before they can create passive income streams.'),
        ContentSection(type: 'subtitle', text: 'Highlights:'),
        ContentSection(type: 'list', items: [
          'Active income = Work for money. Passive income = Money earned with little effort.',
          'Active income examples: Jobs, chores, selling products.',
          'Passive income examples: Interest, rental payments, royalties.',
          'Passive income can help you earn money while you sleep.',
          'Starting with active income can lead to passive income opportunities.',
        ]),
      ],
    ),

    'Stage 5_Level 3_Savings': StageContent(
      cardTexts: [
        'Save first to manage money wisely.',
        'Earn money by working, selling, or offering services.',
        'Set clear savings goals to stay focused.',
        'Active income = work; passive income = money that grows on its own.',
        'Good money habits lead to financial success.',
      ],
      readingSections: [
        ContentSection(
            type: 'title', text: 'Smart Ways to Save and Earn Money'),
        ContentSection(
            type: 'paragraph',
            text:
                'Managing money wisely means saving before spending, earning money, setting savings goals, and understanding income types. These habits help build financial security.'),
        ContentSection(type: 'subtitle', text: '1. Saving Before Spending'),
        ContentSection(type: 'list', items: [
          'Decide how much to save.',
          'Set savings aside before spending.',
          'Use what\'s left for needs and wants.',
          'Track progress to stay on target.',
        ]),
        ContentSection(type: 'subtitle', text: '2. Ways to Earn Money'),
        ContentSection(type: 'list', items: [
          'Doing chores for an allowance.',
          'Helping neighbors with small tasks.',
          'Selling handmade crafts or snacks.',
          'Providing services like washing cars or tutoring.',
        ]),
        ContentSection(type: 'subtitle', text: '3. Setting Savings Goals'),
        ContentSection(type: 'list', items: [
          'Saving for a bicycle (short-term goal).',
          'Saving for college (long-term goal).',
          'Setting a fixed amount to save each month.',
        ]),
        ContentSection(type: 'subtitle', text: '4. Active vs. Passive Income'),
        ContentSection(type: 'list', items: [
          'Active income – Money earned from work (jobs, chores, selling crafts).',
          'Passive income – Money earned with little effort (interest, rent, royalties).',
        ]),
        ContentSection(type: 'subtitle', text: 'Highlights:'),
        ContentSection(type: 'list', items: [
          'Save first to manage money wisely.',
          'Earn money by working, selling, or offering services.',
          'Set clear savings goals to stay focused.',
          'Active income = work; passive income = money that grows on its own.',
          'Good money habits lead to financial success.',
        ]),
      ],
    ),

    'Stage 1_Level 4_Savings': StageContent(
      cardTexts: [
        'Interest is extra money banks pay for saving.',
        'Saving in a bank helps your money grow over time.',
        'Simple interest is earned on deposits; compound interest grows even faster.',
        'Spending all your money or borrowing to save doesn\'t help savings grow.',
      ],
      readingSections: [
        ContentSection(
            type: 'title',
            text: 'Understanding Interest and How It Helps Savings'),
        ContentSection(
            type: 'paragraph',
            text:
                'Interest is a reward banks give for saving money with them. It helps your savings grow over time, making it a smart way to build financial security.'),
        ContentSection(type: 'subtitle', text: '1. Why Do Banks Pay Interest?'),
        ContentSection(
            type: 'paragraph',
            text:
                'Banks use the money in savings accounts to lend to others. In return, they pay interest to encourage people to save with them.'),
        ContentSection(type: 'subtitle', text: '2. Ways to Grow Savings'),
        ContentSection(
            type: 'dropdown',
            header: 'Keeping money in a savings account',
            body: 'Safe and earns interest.'),
        ContentSection(
            type: 'dropdown',
            header: 'Saving regularly',
            body: 'The more you save, the more you earn.'),
        ContentSection(
            type: 'dropdown',
            header: 'Earning interest',
            body: 'Banks add extra money to your savings.'),
        ContentSection(type: 'subtitle', text: '3. Types of Interest'),
        ContentSection(
            type: 'dropdown',
            header: 'Simple interest',
            body: 'Earned only on the original deposit (principal).'),
        ContentSection(
            type: 'dropdown',
            header: 'Compound interest',
            body:
                'Earns interest on both your deposit and past interest, helping your savings grow faster.'),
        ContentSection(type: 'subtitle', text: 'Highlights:'),
        ContentSection(type: 'list', items: [
          'Interest is extra money banks pay for saving.',
          'Saving in a bank helps your money grow over time.',
          'Simple interest is earned on deposits; compound interest grows even faster.',
          'Spending all your money or borrowing to save doesn\'t help savings grow.',
        ]),
      ],
    ),

    'Stage 2_Level 4_Savings': StageContent(
      cardTexts: [
        'Compound interest adds interest on top of previous interest, making savings grow faster.',
        'The earlier you start saving, the more your money grows.',
        'Keeping savings untouched allows compound interest to work best.',
        'Regularly adding to savings increases how much interest you earn.',
      ],
      readingSections: [
        ContentSection(type: 'title', text: 'The Power of Compound Savings'),
        ContentSection(
            type: 'paragraph',
            text:
                'Compound interest helps your savings grow faster by adding interest not just to your original savings but also to the interest you\'ve already earned. The longer you leave your money, the more it grows!'),
        ContentSection(
            type: 'subtitle', text: '1. How Compound Interest Works'),
        ContentSection(
            type: 'dropdown',
            header: 'Step 1',
            body: 'Earn interest on your savings.'),
        ContentSection(
            type: 'dropdown',
            header: 'Step 2',
            body: 'The interest gets added to your total savings.'),
        ContentSection(
            type: 'dropdown',
            header: 'Step 3',
            body:
                'Next time, you earn interest on both your savings and past interest.'),
        ContentSection(
            type: 'dropdown',
            header: 'Step 4',
            body: 'Keep saving, and your money grows even faster over time.'),
        ContentSection(
            type: 'subtitle',
            text: '2. Best Ways to Benefit from Compound Interest'),
        ContentSection(
            type: 'dropdown',
            header: 'Start saving early',
            body: 'More time means more growth.'),
        ContentSection(
            type: 'dropdown',
            header: 'Leave your savings untouched',
            body: 'The longer it stays, the more it earns.'),
        ContentSection(
            type: 'dropdown',
            header: 'Add to your savings regularly',
            body: 'Bigger savings = bigger interest earnings.'),
        ContentSection(type: 'subtitle', text: 'Highlights:'),
        ContentSection(type: 'list', items: [
          'Compound interest adds interest on top of previous interest, making savings grow faster.',
          'The earlier you start saving, the more your money grows.',
          'Keeping savings untouched allows compound interest to work best.',
          'Regularly adding to savings increases how much interest you earn.',
        ]),
      ],
    ),

    'Stage 3_Level 4_Savings': StageContent(
      cardTexts: [
        'Saving regularly, even in small amounts, helps money grow over time.',
        'Keeping money in a safe place ensures it doesn\'t get spent too easily.',
        'Setting a savings goal helps you stay focused.',
        'Cutting unnecessary expenses makes it easier to save.',
      ],
      readingSections: [
        ContentSection(type: 'title', text: 'Smart Savings Strategies'),
        ContentSection(
            type: 'paragraph',
            text:
                'Saving money is easier when you have a plan and good habits. By making smart choices, you can grow your savings over time and avoid unnecessary spending.'),
        ContentSection(type: 'subtitle', text: '1. Good vs. Bad Saving Habits'),
        ContentSection(
            type: 'dropdown',
            header: 'Good habits:',
            body:
                'Save a fixed amount regularly, even if it\'s small.\nKeep your savings in a safe place like a piggy bank or bank account.\nSet a savings goal to stay motivated.'),
        ContentSection(
            type: 'dropdown',
            header: 'Bad habits:',
            body:
                'Spending first and saving only if there\'s money left.\nTaking money out of savings for unplanned spending.'),
        ContentSection(
            type: 'subtitle', text: '2. How to Save More Effectively'),
        ContentSection(
            type: 'dropdown',
            header: 'Stick to a budget',
            body: 'It helps you manage spending and savings.'),
        ContentSection(
            type: 'dropdown',
            header: 'Save a little at a time',
            body: 'Small amounts add up!'),
        ContentSection(
            type: 'dropdown',
            header: 'Reduce unnecessary spending',
            body: 'This frees up more money to save.'),
        ContentSection(type: 'subtitle', text: 'Highlights:'),
        ContentSection(type: 'list', items: [
          'Saving regularly, even in small amounts, helps money grow over time.',
          'Keeping money in a safe place ensures it doesn\'t get spent too easily.',
          'Setting a savings goal helps you stay focused.',
          'Cutting unnecessary expenses makes it easier to save.',
        ]),
      ],
    ),

    'Stage 4_Level 4_Savings': StageContent(
      cardTexts: [
        'Financial discipline helps you save more and avoid wasteful spending.',
        'Creating a budget and setting savings goals keeps your finances organized.',
        'Tracking your savings helps you stay motivated.',
        'Avoiding impulse purchases allows you to save for more important things.',
      ],
      readingSections: [
        ContentSection(
            type: 'title', text: 'Financial Discipline and Smart Habits'),
        ContentSection(
            type: 'paragraph',
            text:
                'Financial discipline means making smart choices with your money so you can save and reach your goals. It helps you avoid unnecessary spending and stay on track with your finances.'),
        ContentSection(
            type: 'subtitle', text: '1. Steps to Build Financial Discipline'),
        ContentSection(
            type: 'dropdown',
            header: 'Create a budget',
            body: 'This helps you plan your spending and savings.'),
        ContentSection(
            type: 'dropdown',
            header: 'Set a savings goal',
            body: 'Knowing what you\'re saving for keeps you motivated.'),
        ContentSection(
            type: 'dropdown',
            header: 'Avoid impulse spending',
            body: 'Think before buying things you don\'t really need.'),
        ContentSection(
            type: 'dropdown',
            header: 'Track your progress',
            body: 'Checking your savings regularly helps you stay on track.'),
        ContentSection(
            type: 'subtitle', text: '2. Good vs. Bad Financial Habits'),
        ContentSection(
            type: 'dropdown',
            header: 'Good habits:',
            body:
                'Sticking to a budget, tracking savings, and making smart spending decisions.'),
        ContentSection(
            type: 'dropdown',
            header: 'Bad habits:',
            body:
                'Buying unnecessary items, ignoring savings goals, and spending impulsively.'),
        ContentSection(type: 'subtitle', text: 'Highlights:'),
        ContentSection(type: 'list', items: [
          'Financial discipline helps you save more and avoid wasteful spending.',
          'Creating a budget and setting savings goals keeps your finances organized.',
          'Tracking your savings helps you stay motivated.',
          'Avoiding impulse purchases allows you to save for more important things.',
        ]),
      ],
    ),

    'Stage 5_Level 4_Savings': StageContent(
      cardTexts: [
        'Interest helps your savings grow, and compound interest grows it even faster.',
        'Saving a little regularly is better than saving only when you have extra money.',
        'Setting a goal and sticking to a plan makes saving easier.',
        'Financial discipline, like budgeting and avoiding impulse spending, helps you save more.',
      ],
      readingSections: [
        ContentSection(
            type: 'title', text: 'Final Test on Making Your Savings Grow'),
        ContentSection(
            type: 'paragraph',
            text:
                'Saving money is not just about setting money aside—it\'s about using smart strategies to make your savings grow. By understanding interest, using good savings habits, and practicing financial discipline, you can build a strong financial future.'),
        ContentSection(
            type: 'subtitle',
            text: '1. Understanding Interest and Compound Savings'),
        ContentSection(
            type: 'dropdown',
            header: 'Interest',
            body:
                'Is extra money banks pay you for keeping your savings with them.'),
        ContentSection(
            type: 'dropdown',
            header: 'Compound interest',
            body:
                'Helps your savings grow faster because you earn interest on both your money and past interest.'),
        ContentSection(
            type: 'dropdown',
            header: 'Starting early and leaving savings untouched',
            body: 'Allows compound interest to work best.'),
        ContentSection(type: 'subtitle', text: '2. Smart Savings Strategies'),
        ContentSection(
            type: 'dropdown',
            header: 'Save regularly',
            body: 'Instead of waiting for a big amount.'),
        ContentSection(
            type: 'dropdown',
            header: 'Set a savings goal',
            body: 'So you know what you\'re working toward.'),
        ContentSection(
            type: 'dropdown',
            header: 'Avoid spending first and saving later',
            body: 'Always save before you spend.'),
        ContentSection(
            type: 'subtitle', text: '3. Financial Discipline and Smart Habits'),
        ContentSection(
            type: 'dropdown',
            header: 'Create a budget',
            body: 'To plan your spending and savings.'),
        ContentSection(
            type: 'dropdown',
            header: 'Track your progress',
            body: 'So you can stay on target.'),
        ContentSection(
            type: 'dropdown',
            header: 'Avoid impulse buying',
            body: 'Think before you spend to keep your savings safe.'),
        ContentSection(type: 'subtitle', text: 'Highlights:'),
        ContentSection(type: 'list', items: [
          'Interest helps your savings grow, and compound interest grows it even faster.',
          'Saving a little regularly is better than saving only when you have extra money.',
          'Setting a goal and sticking to a plan makes saving easier.',
          'Financial discipline, like budgeting and avoiding impulse spending, helps you save more.',
        ]),
      ],
    ),
  };

  static StageContent? getContent(String stageKey, int level, String category) {
    final key = '${stageKey}_Level ${level}_$category';
    return content[key];
  }
}
