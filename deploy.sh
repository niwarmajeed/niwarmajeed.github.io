#!/bin/bash

# Flutter Web Deployment Script for GitHub Pages
# ئەڤ سکرێپتە پرۆژەی دروست دکەت بۆ بەلاڤکرنێ ل سەر گیت-هاب

set -e

echo "🚀 دەستپێکرنا پرۆسەیا ئامادەکرنێ (Deployment)..."

# پشکنین کا ئەرێ فڵاتەر یێ دامەزراندی یە
if ! command -v flutter &> /dev/null; then
    echo "❌ فڵاتەر نەهاتیە دیتن. تکایە بەری هەر تشتەکی فڵاتەری دامەزرێنە."
    exit 1
fi

# پاقژکرنا فایله‌ن کۆن
echo "🧹 پاقژکرنا وەشانێن کۆن (Flutter Clean)..."
flutter clean

# ئینانا پاکێجان
echo "📦 ئینانا دەپێندێنسیان (Pub get)..."
flutter pub get

# دروستکرنا وەشانا وێبێ
echo "🔨 دروستکرنا مالپەری (Building Flutter Web)..."
flutter build web --release --base-href "/"

# پشکنین کا ئەرێ دروست بوو یان نە
if [ ! -d "build/web" ]; then
    echo "❌ خەتا پەیدا بوو د دروستکرنێ دا."
    exit 1
fi

echo "✅ مالپەر ب سەرکەفتیانە هاتە دروستکرن!"
echo ""
echo "📋 هەنگاڤێن داهاتی:"
echo "1. فایلێن مالپەری نوکە د ناڤ فۆڵدەرا 'build/web' دانە."
echo "2. کۆدی خۆ بنێرە (Push) بۆ سەر GitHub:"
echo "   git add ."
echo "   git commit -m 'Update website by Niwar'"
echo "   git push origin main"
echo ""
echo "🌐 مالپەرێ تە دێ ل سەر ڤێ لینکێ بەردەست بیت:"
echo "   https://niwar-majeed.github.io/"