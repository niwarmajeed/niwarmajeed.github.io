#!/bin/bash

# Repository Rename Helper Script بۆ نیوار مەجید
# 
# ئارمانج: نووژەنکرنا رێکخستنێن گیت (Git) پشتی گوهۆڕینا ناڤێ پرۆژەی ل سەر گیت-هاب
# Usage: ./update-after-rename.sh

set -e

echo "=========================================="
echo "سکرێپتێ هاریکار بۆ گوهۆڕینا ناڤێ پرۆژەی"
echo "=========================================="
echo ""
echo "⚠️  گرنگ: ئەڤ سکرێپتە پشتی هندێ دهێتە بکارئینان کو تە ناڤێ پرۆژەی ل سەر GitHub گوهۆڕیبیت!"
echo ""
echo "پێنگاڤێن گوهۆڕینا ناڤی ل سەر GitHub:"
echo "1. هەرە لاپەرێ پرۆژێ خۆ ل سەر GitHub"
echo "2. کلیکێ ل سەر 'Settings' بکە ل باری سەرێ"
echo "3. ل پشکا 'Repository name' ناڤی بگوهۆڕە"
echo "4. ناڤێ نوو بنڤیسە: niwar-majeed.github.io"
echo "5. کلیکێ ل سەر 'Rename' بکە"
echo ""
read -p "ئەرێ تە ناڤێ پرۆژەی ل سەر GitHub گوهۆڕی؟ (y/n) " -n 1 -r
echo ""

if [[ ! $REPLY =~ ^[Yy]$ ]]; then
    echo "❌ تکایە بەری هەر تشتەکی ناڤی ل سەر GitHub بگوهۆڕە، پاشان ئەڤی سکرێپتی دووبارە لێبدە."
    exit 1
fi

echo ""
echo "✅ دەستپێکرنا نووژەنکرنا رێکخستنێن ناوخۆیی..."
echo ""

# وەرگرتنا ناڤێ بەکارهێنەری ب شێوەیەکێ ئۆتۆماتیکی
CURRENT_REMOTE=$(git remote get-url origin)
USERNAME=$(echo "$CURRENT_REMOTE" | sed -E 's|.*github\.com[:/]([^/]+)/.*|\1|')

if [ -z "$USERNAME" ]; then
    echo "❌ نەشیا ناڤێ بەکارهێنەری (Username) ببینیت."
    echo "رێکا نوکە: $CURRENT_REMOTE"
    exit 1
fi

echo "📝 ناڤێ تە یێ گیت-هاب: $USERNAME"
echo ""

# گوهۆڕینا لینکا ریمۆت
echo "📝 نووژەنکرنا لینکا گیت (Remote URL)..."
git remote set-url origin "https://github.com/${USERNAME}/${USERNAME}.github.io.git"

# پشتراستکرن
echo "✅ لینکا نوو ب سەرکەفتیانە هاتە جێگیرکرن!"
echo ""
echo "رێکخستنێن نوکە:"
git remote -v

echo ""
echo "=========================================="
echo "✅ کار ب دوماهی هات!"
echo "=========================================="
echo ""
echo "نوکە پرۆژێ تە یێ ئامادەیە بۆ بەلاڤکرنێ ل سەر لینکا سەرەکی."
echo ""
echo "پێنگاڤێن داهاتی:"
echo "1. کۆدێ خۆ بنێرە (Push) بۆ سەر GitHub:"
echo "   git add ."
echo "   git commit -m 'Update after repository rename'"
echo "   git push origin main"
echo ""
echo "2. مالپەرێ تە دێ ل سەر ڤێ لینکێ بەردەست بیت:"
echo "   https://${USERNAME}.github.io/"
echo ""