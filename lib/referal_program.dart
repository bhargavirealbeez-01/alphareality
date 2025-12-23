import 'package:alphareality/widgets/bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:math' as math;

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        body: const HomeScreen(),
      ),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              const SizedBox(height: 40),

              // LOGO
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: SizedBox(
                  child: FittedBox(
                    child: Image.asset(
                      'assets/logo.png',
                      height: 98,
                      width: 270,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 20),
              _buildReferralProgramSection(),
              const SizedBox(height: 30),
              _buildSaveButton(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: CustomBottomNavBar(
        selectedIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
    );
  }

  Widget _buildReferralProgramSection() {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // Title
        Text(
          'REFERRAL PROGRAM',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.black,
            letterSpacing: 0.5,
          ),
        ),
        SizedBox(height: 40),
        ReferralFormSection(),
        SizedBox(height: 26),
        BudgetBarDemo(),
      ],
    );
  }

  Widget _buildSaveButton() {
    return SizedBox(
      height: 50,
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              backgroundColor: Colors.green,
              content: Text("Saved Successfully"),
            ),
          );
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color.fromRGBO(155, 155, 155, 1),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          elevation: 0,
        ),
        child: const Text(
          "SAVE",
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.black,
            letterSpacing: 0.24,
          ),
        ),
      ),
    );
  }
}


// Rest of your existing code remains exactly the same...
class ReferralFormSection extends StatefulWidget {
  const ReferralFormSection({super.key});

  @override
  State<ReferralFormSection> createState() => _ReferralFormSectionState();
}

class _ReferralFormSectionState extends State<ReferralFormSection> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _nameCtrl = TextEditingController();
  final TextEditingController _phoneCtrl = TextEditingController();
  final TextEditingController _locationCtrl = TextEditingController();

  String? _selectedProfession;
  String? _selectedProperty;

  bool _professionInvalid = false;
  bool _propertyInvalid = false;

  final List<String> _professions = [
    'Real Estate Agent',
    'Developer',
    'Investor',
    'Broker',
    'Consultant',
    'Student',
    'Other'
  ];

  final List<String> _properties = [
    'Apartment',
    'Villa',
    'Plot',
    'Commercial',
    'Industrial',
    'PG / Hostel'
  ];

  InputDecoration _buildCleanDecoration({required String label, Widget? suffixIcon}) {
    return InputDecoration(
      labelText: label,
      labelStyle: const TextStyle(
        color: Colors.black54,
        fontSize: 14,
      ),
      floatingLabelBehavior: FloatingLabelBehavior.auto,
      suffixIcon: suffixIcon,
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(color: Colors.grey),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(color: Colors.grey),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(color: Colors.black, width: 1.5),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(color: Colors.red),
      ),
      filled: false,
    );
  }

  String? validatePhone(String? v) {
    if (v == null || v.isEmpty) return "Required";
    final cleaned = v.replaceAll(RegExp(r'\D'), '');
    final reg = RegExp(r'^[6-9]\d{9}$');
    if (!reg.hasMatch(cleaned)) return "Invalid Number";
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          // Full Name
          TextFormField(
            controller: _nameCtrl,
            style: const TextStyle(fontSize: 14),
            decoration: _buildCleanDecoration(label: "Full Name"),
            validator: (v) => v!.trim().isEmpty ? "Required" : null,
          ),
          const SizedBox(height: 16),

          // Contact Number
          TextFormField(
            controller: _phoneCtrl,
            style: const TextStyle(fontSize: 14),
            keyboardType: TextInputType.phone,
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            decoration: _buildCleanDecoration(
              label: "Contact Number",
            ),
            validator: validatePhone,
          ),
          const SizedBox(height: 16),

          // Current Location
          TextFormField(
            controller: _locationCtrl,
            style: const TextStyle(fontSize: 14),
            decoration: _buildCleanDecoration(
              label: "Current Location",
            ),
            validator: (v) => v!.trim().isEmpty ? "Required" : null,
          ),
          const SizedBox(height: 16),

          // Profession Dropdown
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                    color: _professionInvalid ? Colors.red : Colors.grey,
                  ),
                ),
                child: DropdownButtonHideUnderline(
                  child: DropdownButtonFormField<String>(
                    isExpanded: true,
                    value: _selectedProfession,
                    style: const TextStyle(fontSize: 14),
                    decoration: InputDecoration(
                      hintText: "Choose Profession",
                      hintStyle: const TextStyle(
                        color: Colors.black54,
                        fontSize: 14,
                      ),
                      labelStyle: const TextStyle(
                        color: Colors.black54,
                        fontSize: 14,
                      ),
                      floatingLabelBehavior: FloatingLabelBehavior.auto,
                      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                      border: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      errorBorder: InputBorder.none,
                    ),
                    items: _professions
                        .map((e) => DropdownMenuItem(
                              value: e,
                              child: Text(
                                e,
                                style: const TextStyle(fontSize: 14),
                              ),
                            ))
                        .toList(),
                    onChanged: (v) {
                      setState(() {
                        _selectedProfession = v;
                        _professionInvalid = false;
                      });
                    },
                    icon: const Icon(Icons.arrow_drop_down, color: Colors.grey),
                  ),
                ),
              ),
              if (_professionInvalid)
                const Padding(
                  padding: EdgeInsets.only(left: 8, top: 4),
                  child: Text(
                    "Required",
                    style: TextStyle(color: Colors.red, fontSize: 12),
                  ),
                ),
            ],
          ),
          const SizedBox(height: 16),

          // Property Type Dropdown
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                    color: _propertyInvalid ? Colors.red : Colors.grey,
                  ),
                ),
                child: DropdownButtonHideUnderline(
                  child: DropdownButtonFormField<String>(
                    isExpanded: true,
                    value: _selectedProperty,
                    style: const TextStyle(fontSize: 14),
                    decoration: InputDecoration(
                      hintText: "Property Type",
                      hintStyle: const TextStyle(
                        color: Colors.black54,
                        fontSize: 14,
                      ),
                      labelStyle: const TextStyle(
                        color: Colors.black54,
                        fontSize: 14,
                      ),
                      floatingLabelBehavior: FloatingLabelBehavior.auto,
                      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                      border: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      errorBorder: InputBorder.none,
                    ),
                    items: _properties
                        .map((e) => DropdownMenuItem(
                              value: e,
                              child: Text(
                                e,
                                style: const TextStyle(fontSize: 14),
                              ),
                            ))
                        .toList(),
                    onChanged: (v) {
                      setState(() {
                        _selectedProperty = v;
                        _propertyInvalid = false;
                      });
                    },
                    icon: const Icon(Icons.arrow_drop_down, color: Colors.grey),
                  ),
                ),
              ),
              if (_propertyInvalid)
                const Padding(
                  padding: EdgeInsets.only(left: 8, top: 4),
                  child: Text(
                    "Required",
                    style: TextStyle(color: Colors.red, fontSize: 12),
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }
}

// Rest of the code remains exactly the same...
class BudgetBarDemo extends StatelessWidget {
  const BudgetBarDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return const BudgetBarWidget();
  }
}

class BudgetBarWidget extends StatefulWidget {
  const BudgetBarWidget({Key? key}) : super(key: key);

  @override
  State<BudgetBarWidget> createState() => _BudgetBarWidgetState();
}

class _BudgetBarWidgetState extends State<BudgetBarWidget>
    with SingleTickerProviderStateMixin {
  final List<String> _labels = [
    '99 LAKHS',
    '1 CR',
    '2 CR',
    '3 CR',
    '4 CR',
    '5 CR',
    '6 CR',
    '7 CR',
    '8 CR',
    '9 CR',
    '10 CR',
  ];

  final List<bool> _labelAbove = [
    false,
    true,
    false,
    false,
    true,
    false,
    false,
    true,
    false,
    false,
    false,
  ];

  final Set<int> _longTickIndices = {3, 6, 9};
  int _selectedIndex = 4;

  late final AnimationController _controller;
  double _currentNorm = 0.0;
  double _barWidth = 1.0;

  @override
  void initState() {
    super.initState();
    _currentNorm = _selectedIndex / (_labels.length - 1);
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 280),
    )..addListener(() => setState(() {}));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _animateTo(int index) {
    index = index.clamp(0, _labels.length - 1);
    final double start = _currentNorm;
    final double end = index / (_labels.length - 1);

    _controller.stop();
    final Animation<double> anim = Tween<double>(begin: start, end: end)
        .animate(CurvedAnimation(parent: _controller, curve: Curves.easeOutCubic));

    anim.addListener(() {
      setState(() {
        _currentNorm = anim.value;
      });
    });

    _controller.forward(from: 0.0);
    setState(() {
      _selectedIndex = index;
    });
  }

  int _dxToIndex(double dx) {
    if (_barWidth <= 0) return _selectedIndex;
    final double norm = (dx.clamp(0.0, _barWidth) / _barWidth);
    final int idx = (norm * (_labels.length - 1)).round();
    return idx.clamp(0, _labels.length - 1);
  }

  @override
  Widget build(BuildContext context) {
    const leftLabelStyle = TextStyle(
        fontSize: 14, fontWeight: FontWeight.bold, color: Colors.black);
    const smallLabelStyle =
        TextStyle(fontSize: 10, fontWeight: FontWeight.w500, color: Colors.black);
    const selectedLabelStyle =
        TextStyle(fontSize: 10, fontWeight: FontWeight.w800, color: Colors.black);

    const tickGrey = Color(0xFF9E9E9E);
    const tickBlack = Color(0xFF111111);
    const barColor = Color(0xFF111111);

    return LayoutBuilder(builder: (context, constraints) {
      final double totalWidth = constraints.maxWidth;
      final double leftWidth = math.min(120.0, totalWidth * 0.17);
      const double gap = 12.0;
      final double rightAreaWidth = totalWidth - leftWidth - gap;

      _barWidth = rightAreaWidth;

      if (!_controller.isAnimating) {
        _currentNorm = _selectedIndex / (_labels.length - 1);
      }

      final double indicatorX = _currentNorm * _barWidth;

      return Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
              width: leftWidth,
              child: const Text('BUDGET', style: leftLabelStyle)),
          const SizedBox(width: gap),
          Expanded(
            child: Builder(builder: (innerContext) {
              return GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTapDown: (details) {
                  final box = innerContext.findRenderObject() as RenderBox;
                  final local = box.globalToLocal(details.globalPosition);
                  final idx = _dxToIndex(local.dx);
                  _animateTo(idx);
                },
                onPanStart: (details) {
                  final box = innerContext.findRenderObject() as RenderBox;
                  final local = box.globalToLocal(details.globalPosition);
                  final idx = _dxToIndex(local.dx);
                  _animateTo(idx);
                },
                onPanUpdate: (details) {
                  final box = innerContext.findRenderObject() as RenderBox;
                  final local = box.globalToLocal(details.globalPosition);
                  final idx = _dxToIndex(local.dx);
                  if (idx != _selectedIndex) _animateTo(idx);
                },
                child: SizedBox(
                  height: 150,
                  child: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Positioned(
                        left: 0,
                        right: 0,
                        top: 66,
                        child: CustomPaint(
                          size: Size(rightAreaWidth, 1),
                          painter: _BudgetPainter(
                            tickCount: _labels.length,
                            selectedIndex: _selectedIndex,
                            longTickIndices: _longTickIndices,
                            barColor: barColor,
                            tickGrey: tickGrey,
                            tickBlack: tickBlack,
                          ),
                        ),
                      ),
                      ...List.generate(_labels.length, (i) {
                        if (!_labelAbove[i]) return const SizedBox.shrink();
                        if (i == _selectedIndex) return const SizedBox.shrink();

                        final double x = (i / (_labels.length - 1)) * _barWidth;

                        return Positioned(
                          left: x - 24,
                          top: 45,
                          width: 48,
                          child: GestureDetector(
                            onTap: () => _animateTo(i),
                            child: Text(_labels[i],
                                style: smallLabelStyle,
                                textAlign: TextAlign.center),
                          ),
                        );
                      }),
                      ...List.generate(_labels.length, (i) {
                        if (_labelAbove[i]) return const SizedBox.shrink();
                        if (i == _selectedIndex) return const SizedBox.shrink();

                        final bool isLong = _longTickIndices.contains(i);
                        final double y = isLong ? 92 : 84;
                        final double x = (i / (_labels.length - 1)) * _barWidth;

                        return Positioned(
                          left: x - 24,
                          top: y,
                          width: 48,
                          child: GestureDetector(
                            onTap: () => _animateTo(i),
                            child: Text(
                              _labels[i],
                              style: smallLabelStyle,
                              textAlign: TextAlign.center,
                            ),
                          ),
                        );
                      }),
                      Positioned(
                        left: (indicatorX - 48)
                            .clamp(-40.0, rightAreaWidth - 96.0),
                        top: -12,
                        width: 96,
                        child: Center(
                          child: Text(
                            _labels[_selectedIndex],
                            style: selectedLabelStyle,
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                      Positioned(
                        left: indicatorX - 22,
                        top: 0,
                        child: _PinIndicator(
                          onTap: () {
                            final next = (_selectedIndex + 1) % _labels.length;
                            _animateTo(next);
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }),
          ),
        ],
      );
    });
  }
}

class _BudgetPainter extends CustomPainter {
  final int tickCount;
  final int selectedIndex;
  final Set<int> longTickIndices;
  final Color barColor;
  final Color tickGrey;
  final Color tickBlack;

  _BudgetPainter({
    required this.tickCount,
    required this.selectedIndex,
    required this.longTickIndices,
    required this.barColor,
    required this.tickGrey,
    required this.tickBlack,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final double y = 6;

    final Paint linePaint = Paint()
      ..color = barColor
      ..strokeWidth = 3.2
      ..strokeCap = StrokeCap.round;

    canvas.drawLine(Offset(0, y), Offset(size.width, y), linePaint);

    for (int i = 0; i < tickCount; i++) {
      final double t = tickCount == 1 ? 0 : i / (tickCount - 1);
      final double x = t * size.width;

      final bool isLong = longTickIndices.contains(i);
      final bool isSelected = i == selectedIndex;

      final double top = y - (isLong ? 18 : 8);
      final double bottom = y + (isLong ? 18 : 8);

      final Paint tickPaint = Paint()
        ..color = isLong ? tickBlack : tickGrey
        ..strokeWidth = isLong ? 2.8 : 1.6
        ..strokeCap = StrokeCap.round;

      if (isSelected) tickPaint.strokeWidth += 1;

      canvas.drawLine(Offset(x, top), Offset(x, bottom), tickPaint);
    }
  }

  @override
  bool shouldRepaint(covariant _BudgetPainter oldDelegate) {
    return oldDelegate.selectedIndex != selectedIndex ||
        oldDelegate.tickCount != tickCount ||
        oldDelegate.longTickIndices != longTickIndices;
  }
}

class _PinIndicator extends StatelessWidget {
  final VoidCallback? onTap;
  const _PinIndicator({Key? key, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const double pinWidth = 50;
    const double pinHeight = 46;

    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        width: pinWidth,
        height: pinHeight,
        child: Stack(
          alignment: Alignment.center,
          children: [
            CustomPaint(
              size: const Size(pinWidth, pinHeight),
              painter: _PinShapePainter(),
            ),
            Positioned(
              top: 12,
              child: Container(
                width: 22,
                height: 22,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
                child: const Center(
                  child: Icon(
                    Icons.home,
                    size: 20,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _PinShapePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final double w = size.width;
    final double h = size.height;

    final Path path = Path()
      ..moveTo(w / 2, h)
      ..quadraticBezierTo(w, h * 0.48, w * 0.72, h * 0.22)
      ..arcToPoint(
        Offset(w * 0.28, h * 0.22),
        radius: Radius.circular(w * 0.4),
        clockwise: false,
      )
      ..quadraticBezierTo(0, h * 0.48, w / 2, h)
      ..close();

    final Paint fill = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.fill;

    canvas.drawShadow(path, Colors.black.withOpacity(0.35), 6, false);
    canvas.drawPath(path, fill);

    final Paint stroke = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.2;

    canvas.drawPath(path, stroke);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}