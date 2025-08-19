import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:savvybee/video_detail_screen.dart';

class VideosScreen extends StatelessWidget {
  final String category;
  final int level; // Add level parameter

  const VideosScreen({
    Key? key,
    this.category = 'Budgeting',
    this.level = 0, // Default to level 0 (which will show level 1 videos)
  }) : super(key: key);

  // Define videos for each category and level with actual YouTube links
  Map<String, Map<int, List<Map<String, String>>>> get categoryLevelVideos => {
    'Savings': {
      0: [ // Level 1
        {
          'title': 'Quiz 1: Needs vs Wants',
          'url': 'https://youtu.be/QyuU4wFIz3o?feature=shared',
          'description': 'Learn to distinguish between what you need and what you want to make better spending decisions.',
        },
        {
          'title': 'Quiz 2: What is saving?',
          'url': 'https://youtu.be/1Z0kEgx_d18?feature=shared',
          'description': 'Understand the fundamental concept of saving money and why it matters.',
        },
        {
          'title': 'Quiz 3: Why we save money?',
          'url': 'https://youtu.be/pHnkfADAH1M?feature=shared',
          'description': 'Explore the various reasons and benefits of saving money for your future.',
        },
        {
          'title': 'Quiz 4: Savings goals & Discipline',
          'url': 'https://youtu.be/a8DZmC9DYPk?feature=shared',
          'description': 'Learn how to set realistic savings goals and develop the discipline to achieve them.',
        },
      ],
      1: [ // Level 2
        {
          'title': 'Quiz 1: Tracking your money',
          'url': 'https://youtu.be/H5ZkdvRsf6M?feature=shared',
          'description': 'Learn the importance of monitoring where your money goes.',
        },
        {
          'title': 'Quiz 2: How to track your money',
          'url': 'https://youtu.be/pYTPuhJ7JFM?feature=shared',
          'description': 'Practical methods and tools for tracking your expenses and income.',
        },
        {
          'title': 'Quiz 3: Budgeting & Tracking together',
          'url': 'https://youtube.com/shorts/_HQGj01QCdM?feature=shared',
          'description': 'Combine budgeting and tracking for better financial control.',
        },
        {
          'title': 'Quiz 4: Smart Spending & Tricks',
          'url': 'https://youtu.be/LEOSHNcYvUk?feature=shared',
          'description': 'Tips and tricks for making smarter spending decisions.',
        },
      ],
      2: [ // Level 3
        {
          'title': 'Quiz 1: Spending Wisely',
          'url': 'https://youtu.be/X42I7yjsOaQ?feature=shared',
          'description': 'Learn how to make thoughtful spending decisions.',
        },
        {
          'title': 'Quiz 2: Avoiding Impulse Buying',
          'url': 'https://youtu.be/FY6pCHkeED4?feature=shared',
          'description': 'Strategies to resist impulse purchases and stick to your budget.',
        },
        {
          'title': 'Quiz 3: Understanding Value for Money',
          'url': 'https://youtu.be/o-D83FRykRM?feature=shared',
          'description': 'Learn to evaluate whether purchases provide good value.',
        },
        {
          'title': 'Quiz 4: Making a Spending Plan',
          'url': 'https://youtu.be/7dm86CcUf14?feature=shared',
          'description': 'Create a structured plan for your spending habits.',
        },
      ],
      3: [ // Level 4
        {
          'title': 'Quiz 1: Why Saving before spending is important',
          'url': 'https://m.youtube.com/watch?v=cnW_HDIBmz4&pp=4gcNEgtjaGF0Z3B0LmNvbQ%3D%3D',
          'description': 'Understand the principle of paying yourself first.',
        },
        {
          'title': 'Quiz 2: Different ways to earn money',
          'url': 'https://youtu.be/sd0r9GuOflo?feature=shared',
          'description': 'Explore various income streams and earning opportunities.',
        },
        {
          'title': 'Quiz 3: Setting savings goals before spending',
          'url': 'https://youtu.be/a8DZmC9DYPk?feature=shared',
          'description': 'Learn to prioritize savings in your financial planning.',
        },
        {
          'title': 'Quiz 4: Active & Passive income',
          'url': 'https://youtu.be/qgW5P92gDDM?feature=shared',
          'description': 'Understand the difference between active and passive income streams.',
        },
      ],
      4: [ // Level 5
        {
          'title': 'Quiz 1: Understanding interest and how it helps saving',
          'url': 'https://youtu.be/GHHesANT6OM?feature=shared',
          'description': 'Learn how interest can help your savings grow over time.',
        },
        {
          'title': 'Quiz 2: The power of compound interest',
          'url': 'https://youtu.be/jTW777ENc3c?feature=shared',
          'description': 'Discover how compound interest can accelerate your wealth building.',
        },
        {
          'title': 'Quiz 3: Smart saving strategies',
          'url': 'https://youtu.be/VWxEXI5Z274',
          'description': 'Advanced strategies for maximizing your savings potential.',
        },
        {
          'title': 'Quiz 4: Financial Discipline & Smart Habits',
          'url': 'https://youtu.be/7aIyn0zdMeU',
          'description': 'Build lasting financial habits for long-term success.',
        },
      ],
    },
    'Budgeting': {
      0: [ // Level 1
        {
          'title': 'What is a budget',
          'url': 'https://youtu.be/sVKQn2I4HDM?feature=shared',
          'description': 'Learn the fundamental concept of budgeting and its importance.',
        },
        {
          'title': 'Creating your first budget',
          'url': 'https://youtu.be/-vVp185Sq24?feature=shared',
          'description': 'Step-by-step guide to creating your very first budget.',
        },
        {
          'title': 'Understanding expenses',
          'url': 'https://youtu.be/tClqS1vpgt8?feature=shared',
          'description': 'Learn to categorize and understand different types of expenses.',
        },
        {
          'title': 'The 50/30/20 rule',
          'url': 'https://youtu.be/sgCc1DhdsUc?feature=shared',
          'description': 'Master the popular 50/30/20 budgeting rule for balanced finances.',
        },
      ],
      1: [ // Level 2
        {
          'title': 'Quiz 1: Tracking your money',
          'url': 'https://youtu.be/H5ZkdvRsf6M?feature=shared',
          'description': 'Learn effective methods for tracking your income and expenses.',
        },
        {
          'title': 'Quiz 2: Recording Transactions Accurately',
          'url': 'https://youtu.be/kGVql6KvSLg?feature=shared',
          'description': 'Best practices for accurately recording all your financial transactions.',
        },
        {
          'title': 'Quiz 3: Tools for tracking money',
          'url': 'https://youtu.be/Zc69z7wqzK4?feature=shared',
          'description': 'Explore various tools and apps for money tracking.',
        },
        {
          'title': 'Quiz 4: Advanced Tracking Techniques',
          'url': 'https://youtu.be/GK2CUco5TWQ?feature=shared',
          'description': 'Advanced methods for comprehensive financial tracking.',
        },
      ],
      2: [ // Level 3
        {
          'title': 'Quiz 1: Budget Hack',
          'url': 'https://youtu.be/zP1x2q9qF84',
          'description': 'Learn clever budget hacks to optimize your financial planning.',
        },
        {
          'title': 'Quiz 2: Budgeting apps & Spreadsheets',
          'url': 'https://youtu.be/YsZAhfe0YzA?feature=shared',
          'description': 'Compare different budgeting tools and find what works for you.',
        },
        {
          'title': 'Quiz 3: Smart Spending',
          'url': 'https://youtu.be/X42I7yjsOaQ?feature=shared',
          'description': 'Strategies for making intelligent spending decisions.',
        },
        {
          'title': 'Quiz 4: Monthly budget',
          'url': 'https://youtu.be/aYOKCxN-mKg?feature=shared',
          'description': 'Create and maintain an effective monthly budget.',
        },
      ],
      3: [ // Level 4
        {
          'title': 'Quiz 1: Prioritising financial goals',
          'url': 'https://youtu.be/_9Gl1ZGMBdY?feature=shared',
          'description': 'Learn to prioritize and balance multiple financial objectives.',
        },
        {
          'title': 'Quiz 2: Smart Goals',
          'url': 'https://youtu.be/1-SvuFIQjK8?feature=shared',
          'description': 'Set SMART financial goals for better success rates.',
        },
        {
          'title': 'Quiz 3: Goal Achievement Strategies',
          'url': 'https://youtu.be/Duxo4xXeMec?feature=shared',
          'description': 'Proven strategies for achieving your financial goals.',
        },
        {
          'title': 'Quiz 4: Creating a budget',
          'url': 'https://youtu.be/Ww4_nBSWm_o?feature=shared',
          'description': 'Advanced budget creation techniques and best practices.',
        },
      ],
      4: [ // Level 5
        {
          'title': 'Quiz 1: Budgeting in the real world',
          'url': 'https://youtu.be/-cOjBanoNP0?feature=shared',
          'description': 'Apply budgeting principles to real-world scenarios.',
        },
        {
          'title': 'Quiz 2: Unexpected Expenses',
          'url': 'https://youtu.be/QBzLamKv5d8?feature=shared',
          'description': 'Plan for and handle unexpected financial challenges.',
        },
        {
          'title': 'Quiz 3: Budget Forecasting',
          'url': 'https://youtu.be/FL2NcGYQ_Vc?feature=shared',
          'description': 'Learn to forecast and plan your budget for the future.',
        },
        {
          'title': 'Quiz 4: Reviewing Budget',
          'url': 'https://youtu.be/J5LzXpX4m1o?feature=shared',
          'description': 'Regular budget review and adjustment strategies.',
        },
      ],
    },
    'Numeracy': {
      0: [ // Level 1
        {
          'title': 'Quiz 1: Addition',
          'url': 'https://youtu.be/BZ4FjSXjzgg?feature=shared',
          'description': 'Master basic addition skills for financial calculations.',
        },
        {
          'title': 'Quiz 2: Subtraction',
          'url': 'https://youtu.be/r3qKojj4g4g?feature=shared',
          'description': 'Learn subtraction techniques for expense tracking.',
        },
        {
          'title': 'Quiz 3: Comparing monetary values',
          'url': 'https://youtu.be/TOrcUx0wDDQ?feature=shared',
          'description': 'Compare different amounts and values effectively.',
        },
        {
          'title': 'Quiz 4: Real-life Scenarios (addition + subtraction)',
          'url': 'https://youtu.be/EPdkGwXjf7c?feature=shared',
          'description': 'Apply addition and subtraction to real financial situations.',
        },
      ],
      1: [ // Level 2
        {
          'title': 'Quiz 1: Fractions and decimals',
          'url': 'https://youtu.be/Mst8iZjIpFE?feature=shared',
          'description': 'Understand fractions and decimals in financial contexts.',
        },
        {
          'title': 'Quiz 2: Percentages',
          'url': 'https://youtu.be/ZjVUr4ZBf54?feature=shared',
          'description': 'Master percentage calculations for discounts and interest.',
        },
        {
          'title': 'Quiz 3: Calculating discount and sales price',
          'url': 'https://youtu.be/5qxX222sLtE?feature=shared',
          'description': 'Calculate discounts and final sale prices accurately.',
        },
        {
          'title': 'Quiz 4: Evaluating sales offer & price comparison',
          'url': 'https://youtu.be/LeYB7QhIeZw?feature=shared',
          'description': 'Compare prices and evaluate the best deals.',
        },
      ],
      2: [ // Level 3
        {
          'title': 'Quiz 1: Multiplying to find total cost',
          'url': 'https://youtu.be/r-lhsrl-muE?feature=shared',
          'description': 'Use multiplication to calculate total costs and expenses.',
        },
        {
          'title': 'Quiz 2: Division in cost allocation and unit pricing',
          'url': 'https://youtu.be/kFNEqLWy1P4?feature=shared',
          'description': 'Apply division for cost allocation and unit price calculations.',
        },
        {
          'title': 'Quiz 3: Unit Price Analysis',
          'url': 'https://youtu.be/kFNEqLWy1P4?feature=shared',
          'description': 'Analyze unit prices to make better purchasing decisions.',
        },
        {
          'title': 'Quiz 4: Multi-step calculations',
          'url': 'https://youtu.be/7gQePWsCJrA?feature=shared',
          'description': 'Solve complex multi-step financial problems.',
        },
      ],
      3: [ // Level 4
        {
          'title': 'Quiz 1: Introduction to simple interest',
          'url': 'https://youtu.be/NCYNXkbTTUo?feature=shared',
          'description': 'Understand and calculate simple interest on loans and savings.',
        },
        {
          'title': 'Quiz 2: Introduction to compound interest',
          'url': 'https://youtu.be/U0Lwyh9ONMM?feature=shared',
          'description': 'Learn compound interest calculations and their applications.',
        },
        {
          'title': 'Quiz 3: Applying interest in real life',
          'url': 'https://youtu.be/gvgFUsvhrlQ?feature=shared',
          'description': 'Apply interest calculations to real-world financial scenarios.',
        },
        {
          'title': 'Quiz 4: Comparing savings over time',
          'url': 'https://youtu.be/gyiiqUQgEeA?feature=shared',
          'description': 'Compare different savings options using interest calculations.',
        },
      ],
      4: [ // Level 5
        {
          'title': 'Quiz 1: Budgeting with math',
          'url': 'https://youtu.be/0iRbD5rM5qc?feature=shared',
          'description': 'Apply mathematical skills to create effective budgets.',
        },
        {
          'title': 'Quiz 2: Forecasting & Managing expenses',
          'url': 'https://youtu.be/E2C7Piwlaxc?feature=shared',
          'description': 'Use math to forecast and manage future expenses.',
        },
        {
          'title': 'Quiz 3: Creating a budget step by step',
          'url': 'https://youtu.be/-vVp185Sq24?feature=shared',
          'description': 'Mathematical approach to systematic budget creation.',
        },
        {
          'title': 'Quiz 4: Adjusting your budget for changing circumstances',
          'url': 'https://youtu.be/sqF4_L4rIBw?feature=shared',
          'description': 'Mathematically adjust budgets for life changes.',
        },
      ],
    },
  };

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    
    // Get videos for the specific category and level
    final videos = categoryLevelVideos[category]?[level] ?? [];
    final displayLevel = level + 1; // Display level starts from 1

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
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: Row(
          children: [
            Text(
              'Videos on $category - Level $displayLevel',
              style: GoogleFonts.manrope(
                color: Colors.black,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
            const Spacer(),
            Container(
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
          ],
        ),
      ),
      body: videos.isEmpty
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.video_library_outlined,
                    size: 64,
                    color: Colors.grey.shade400,
                  ),
                  SizedBox(height: 16),
                  Text(
                    'No videos available for this level yet',
                    style: GoogleFonts.manrope(
                      fontSize: 18,
                      color: Colors.grey.shade600,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Complete previous levels to unlock more content',
                    style: GoogleFonts.manrope(
                      fontSize: 14,
                      color: Colors.grey.shade500,
                    ),
                  ),
                ],
              ),
            )
          : Padding(
              padding: EdgeInsets.symmetric(
                horizontal: screenWidth * 0.04,
                vertical: screenHeight * 0.02,
              ),
              child: ListView.builder(
                itemCount: videos.length,
                itemBuilder: (context, index) {
                  final video = videos[index];
                  return Padding(
                    padding: EdgeInsets.only(bottom: screenHeight * 0.03),
                    child: _buildVideoCard(
                      context,
                      video['title']!,
                      video['url']!,
                      video['description']!,
                      index,
                      screenHeight,
                      screenWidth,
                    ),
                  );
                },
              ),
            ),
    );
  }

  Widget _buildVideoCard(
    BuildContext context,
    String title,
    String videoUrl,
    String description,
    int videoIndex,
    double screenHeight,
    double screenWidth,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Video title
        Padding(
          padding: EdgeInsets.only(bottom: screenHeight * 0.015),
          child: Text(
            title,
            style: GoogleFonts.manrope(
              fontSize: screenHeight * 0.018,
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
          ),
        ),
        // Video thumbnail with play button
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => VideoDetailScreen(
                  category: category,
                  level: level,
                  videoTitle: title,
                  videoUrl: videoUrl,
                  videoIndex: videoIndex,
                  description: description,
                ),
              ),
            );
          },
          child: Container(
            width: double.infinity,
            height: screenHeight * 0.25,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.grey.shade300, width: 1),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Stack(
                children: [
                  // Thumbnail background
                  Container(
                    width: double.infinity,
                    height: double.infinity,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          Colors.blue.shade100,
                          Colors.purple.shade100,
                        ],
                      ),
                    ),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.video_library,
                            size: 40,
                            color: Colors.grey.shade600,
                          ),
                          SizedBox(height: 8),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 16),
                            child: Text(
                              description,
                              textAlign: TextAlign.center,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: GoogleFonts.manrope(
                                fontSize: 12,
                                color: Colors.grey.shade700,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  // Play button overlay
                  Center(
                    child: Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.7),
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.play_arrow,
                        color: Colors.white,
                        size: 30,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
