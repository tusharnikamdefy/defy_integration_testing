GREEN='\033[0;32m'
NC='\033[0m'
LINE_BREAK="${GREEN} --- ${NC}"

echo "$LINE_BREAK"
echo "${GREEN}Welcome Screen Tests begin ${NC}"
echo "$LINE_BREAK"

# Test the Welcome Screen
flutter drive \
  --driver=test_driver/integration_test_driver.dart \
  --target=integration_test/welcome_screen_test.dart

echo "$LINE_BREAK"
echo "${GREEN}Power Meter Test begins ${NC}"
echo "$LINE_BREAK"

# Test the add power meter entry
flutter drive \                                                                         
--driver=test_driver/integration_test_driver.dart \
--target=integration_test/app_test.dart