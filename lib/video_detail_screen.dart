import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:savvybee/navbar.dart';

class VideoDetailScreen extends StatefulWidget {
  final String category;
  final int level;
  final String videoTitle;
  final String videoUrl;
  final int videoIndex;
  final String description;

  const VideoDetailScreen({
    Key? key,
    required this.category,
    required this.level,
    required this.videoTitle,
    required this.videoUrl,
    required this.videoIndex,
    required this.description,
  }) : super(key: key);

  @override
  State<VideoDetailScreen> createState() => _VideoDetailScreenState();
}

class _VideoDetailScreenState extends State<VideoDetailScreen> {
  late WebViewController _webViewController;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _initializeWebView();
  }

  void _initializeWebView() {
    // Convert YouTube URL to embed format
    String embedUrl = _convertToEmbedUrl(widget.videoUrl);
    
    _webViewController = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(
        NavigationDelegate(
          onPageFinished: (String url) {
            setState(() {
              _isLoading = false;
            });
          },
        ),
      )
      ..loadRequest(Uri.parse(embedUrl));
  }

  String _convertToEmbedUrl(String youtubeUrl) {
    // Extract video ID from various YouTube URL formats
    String videoId = '';
    
    if (youtubeUrl.contains('youtu.be/')) {
      videoId = youtubeUrl.split('youtu.be/')[1].split('?')[0];
    } else if (youtubeUrl.contains('youtube.com/watch?v=')) {
      videoId = youtubeUrl.split('v=')[1].split('&')[0];
    } else if (youtubeUrl.contains('youtube.com/shorts/')) {
      videoId = youtubeUrl.split('shorts/')[1].split('?')[0];
    } else if (youtubeUrl.contains('m.youtube.com/watch?v=')) {
      videoId = youtubeUrl.split('v=')[1].split('&')[0];
    }
    
    return 'https://www.youtube.com/embed/$videoId';
  }

  // Define detailed content for each video based on category, level, and video index
  String get videoNotes {
    final key = '${widget.category}_${widget.level}_${widget.videoIndex}';
    
    final notesMap = <String, String>{
      // Savings Level 1
      'Savings_0_0': '''
**Understanding Needs vs Wants**

**Key Concepts:**
• **Needs**: Essential items required for survival and basic functioning
  - Food and water
  - Shelter and housing
  - Basic clothing
  - Healthcare
  - Transportation to work/school

• **Wants**: Items that improve quality of life but aren't essential
  - Entertainment subscriptions
  - Designer clothing
  - Dining out frequently
  - Latest gadgets
  - Luxury items

**The 24-Hour Rule:**
Before making any non-essential purchase, wait 24 hours. This helps you determine if it's truly needed or just wanted.

**Questions to Ask Yourself:**
1. Will I use this regularly?
2. Do I already have something similar?
3. Can I afford this without affecting my savings goals?
4. Will I still want this in a month?
      ''',
      
      'Savings_0_1': '''
**What is Saving?**

**Definition:**
Saving is setting aside money from your current income for future use, rather than spending it immediately.

**Types of Saving:**
• **Emergency Fund**: 3-6 months of expenses for unexpected situations
• **Short-term Goals**: Vacation, new phone, car repairs (1-2 years)
• **Long-term Goals**: House deposit, retirement, education (5+ years)

**The Saving Formula:**
Income - Expenses = Savings

**Key Principles:**
1. Pay yourself first - save before spending
2. Start small - even \$5/week makes a difference
3. Automate your savings
4. Keep savings separate from spending money
5. Review and adjust regularly
      ''',
      
      'Savings_0_2': '''
**Why We Save Money**

**Financial Security:**
• Protection against unexpected expenses
• Reduced financial stress and anxiety
• Independence and freedom of choice

**Goal Achievement:**
• Ability to purchase larger items without debt
• Investment in education and skill development
• Creating opportunities for the future

**Peace of Mind:**
• Confidence in handling emergencies
• Better sleep knowing you're prepared
• Reduced reliance on others for financial help

**Building Wealth:**
• Money saved can earn interest
• Compound growth over time
• Foundation for future investments
      ''',
      
      'Savings_0_3': '''
**Savings Goals & Discipline**

**SMART Goals Framework:**
• **Specific**: Clear, well-defined objective
• **Measurable**: Trackable progress
• **Achievable**: Realistic given your income
• **Relevant**: Important to your life
• **Time-bound**: Clear deadline

**Example SMART Goal:**
"I will save \$1,200 for an emergency fund by saving \$100 per month for 12 months."

**Building Discipline:**
1. **Automate**: Set up automatic transfers
2. **Visual Reminders**: Use savings trackers
3. **Celebrate Milestones**: Reward progress
4. **Find Accountability**: Share goals with trusted friends
5. **Track Progress**: Regular check-ins on your goals

**Common Challenges:**
• Impulse spending
• Irregular income
• Competing priorities
• Lack of motivation
      ''',

      // Budgeting Level 1
      'Budgeting_0_0': '''
**What is a Budget?**

**Definition:**
A budget is a plan that shows how much money you expect to receive and how you plan to spend it over a specific period.

**Budget Formula:**
Income - Expenses = Surplus/Deficit

**Types of Budgets:**
• **Monthly Budget**: Most common, tracks monthly income and expenses
• **Weekly Budget**: Good for irregular income or tight control
• **Annual Budget**: Long-term planning for yearly expenses

**Key Components:**
1. **Income**: All money coming in (salary, allowances, side jobs)
2. **Fixed Expenses**: Same amount each month (rent, insurance)
3. **Variable Expenses**: Changes monthly (groceries, entertainment)
4. **Savings**: Money set aside for future goals

**Benefits of Budgeting:**
• Control over your money
• Reduced financial stress
• Achievement of financial goals
• Better spending decisions
      ''',
      
      'Budgeting_0_1': '''
**Creating Your First Budget**

**Step 1: Calculate Your Income**
• List all sources of money
• Use net income (after taxes)
• Include regular side income
• Be conservative with estimates

**Step 2: Track Your Expenses**
• Review bank statements for 2-3 months
• Categorize all spending
• Include small purchases (coffee, snacks)
• Don't forget annual expenses (insurance, gifts)

**Step 3: Create Categories**
• Housing (rent, utilities)
• Transportation
• Food and groceries
• Personal care
• Entertainment
• Savings

**Step 4: Assign Dollar Amounts**
• Start with fixed expenses
• Estimate variable expenses
• Ensure total doesn't exceed income
• Adjust as needed

**Step 5: Track and Adjust**
• Monitor spending throughout the month
• Compare actual vs. budgeted amounts
• Make adjustments for next month
      ''',

      // Numeracy Level 1
      'Numeracy_0_0': '''
**Basic Addition for Financial Planning**

**Why Addition Matters in Finance:**
• Calculating total income from multiple sources
• Adding up monthly expenses
• Determining total savings over time
• Computing total costs for purchases

**Key Addition Skills:**
• Adding whole numbers (dollars)
• Adding decimals (cents)
• Adding multiple numbers in sequence
• Mental math for quick calculations

**Real-World Examples:**
1. **Total Income**: Salary (\$2,000) + Side job (\$300) + Allowance (\$100) = \$2,400
2. **Monthly Expenses**: Rent (\$800) + Food (\$400) + Transport (\$200) = \$1,400
3. **Savings Goal**: Month 1 (\$50) + Month 2 (\$75) + Month 3 (\$60) = \$185

**Practice Tips:**
• Use a calculator for accuracy
• Double-check your work
• Round numbers for quick estimates
• Practice mental math daily
      ''',

      'Numeracy_0_1': '''
**Basic Subtraction for Financial Planning**

**Why Subtraction Matters in Finance:**
• Calculating remaining money after expenses
• Determining how much you can save
• Finding the difference between income and expenses
• Tracking spending against budget

**Key Subtraction Skills:**
• Subtracting whole numbers
• Subtracting decimals
• Working with negative results (overspending)
• Sequential subtraction

**Real-World Examples:**
1. **Available Money**: Income (\$2,400) - Expenses (\$1,400) = \$1,000 available
2. **Budget Tracking**: Budget (\$300) - Spent (\$275) = \$25 remaining
3. **Savings Calculation**: Goal (\$500) - Current (\$185) = \$315 still needed

**Important Concepts:**
• Negative results mean you're overspending
• Always subtract expenses from income
• Track the difference to stay on budget
• Use subtraction to set realistic goals
      ''',
    };
    
    // Return specific notes if available, otherwise return default notes
    return notesMap[key] ?? _getDefaultNotes();
  }

  String _getDefaultNotes() {
    return '''
**Video Notes**

**Key Learning Points:**
• ${widget.description}

**Important Concepts:**
This video covers essential financial literacy concepts that will help you build a strong foundation for managing your money effectively.

**Action Items:**
1. Watch the video carefully
2. Take notes on key concepts
3. Apply what you learn to your personal situation
4. Practice the skills demonstrated
5. Review the material regularly

**Next Steps:**
Continue with the remaining videos in this level to build upon these concepts and develop your financial knowledge further.
    ''';
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    final displayLevel = widget.level + 1;

    // Set status bar to black icons
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark, // Black icons for Android
      statusBarBrightness: Brightness.light,    // Black icons for iOS
    ));

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.close, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          'Videos on ${widget.category} - Level $displayLevel',
          style: GoogleFonts.manrope(
            color: Colors.black,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: const Color(0xFFFFE975),
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.black, width: 1),
              ),
              child: const Icon(
                Icons.folder,
                color: Colors.black,
                size: 20,
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Video Player Section
            Container(
              width: double.infinity,
              height: screenHeight * 0.25,
              margin: EdgeInsets.all(screenWidth * 0.04),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Colors.black,
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Stack(
                  children: [
                    WebViewWidget(controller: _webViewController),
                    if (_isLoading)
                      const Center(
                        child: CircularProgressIndicator(
                          color: Color(0xFFFFE975),
                        ),
                      ),
                  ],
                ),
              ),
            ),
            
            // Video Title
            Padding(
              padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04),
              child: Text(
                widget.videoTitle,
                style: GoogleFonts.manrope(
                  fontSize: screenHeight * 0.022,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
            ),
            
            SizedBox(height: screenHeight * 0.03),
            
            // Notes Section
            Padding(
              padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04),
              child: Text(
                'Notes',
                style: GoogleFonts.manrope(
                  fontSize: screenHeight * 0.024,
                  fontWeight: FontWeight.w700,
                  color: Colors.black,
                ),
              ),
            ),
            
            SizedBox(height: screenHeight * 0.02),
            
            // Dynamic Content
            Padding(
              padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04),
              child: _buildMarkdownContent(videoNotes, screenHeight),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const Navbar(),
    );
  }

  Widget _buildMarkdownContent(String content, double screenHeight) {
    final lines = content.split('\n');
    List<Widget> widgets = [];
    
    for (String line in lines) {
      if (line.trim().isEmpty) {
        widgets.add(SizedBox(height: screenHeight * 0.01));
      } else if (line.startsWith('**') && line.endsWith('**')) {
        // Bold headers
        widgets.add(
          Padding(
            padding: EdgeInsets.symmetric(vertical: screenHeight * 0.008),
            child: Text(
              line.replaceAll('**', ''),
              style: GoogleFonts.manrope(
                fontSize: screenHeight * 0.02,
                fontWeight: FontWeight.w700,
                color: Colors.black,
              ),
            ),
          ),
        );
      } else if (line.startsWith('• ')) {
        // Bullet points
        widgets.add(
          Padding(
            padding: EdgeInsets.only(
              left: screenHeight * 0.02,
              bottom: screenHeight * 0.005,
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '• ',
                  style: GoogleFonts.manrope(
                    fontSize: screenHeight * 0.016,
                    color: Colors.black87,
                  ),
                ),
                Expanded(
                  child: Text(
                    line.substring(2),
                    style: GoogleFonts.manrope(
                      fontSize: screenHeight * 0.016,
                      color: Colors.black87,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      } else if (line.startsWith('  - ')) {
        // Sub-bullet points
        widgets.add(
          Padding(
            padding: EdgeInsets.only(
              left: screenHeight * 0.04,
              bottom: screenHeight * 0.003,
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '- ',
                  style: GoogleFonts.manrope(
                    fontSize: screenHeight * 0.015,
                    color: Colors.black54,
                  ),
                ),
                Expanded(
                  child: Text(
                    line.substring(4),
                    style: GoogleFonts.manrope(
                      fontSize: screenHeight * 0.015,
                      color: Colors.black54,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      } else if (line.trim().isNotEmpty) {
        // Regular text (skip empty lines)
        widgets.add(
          Padding(
            padding: EdgeInsets.symmetric(vertical: screenHeight * 0.005),
            child: Text(
              line,
              style: GoogleFonts.manrope(
                fontSize: screenHeight * 0.016,
                color: Colors.black87,
              ),
            ),
          ),
        );
      }
    }
    
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: widgets,
    );
  }
}
