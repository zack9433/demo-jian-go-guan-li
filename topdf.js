var markdownpdf = require('markdown-pdf');

var mdDocs = ['docs/APP-Development-f9b8e3d0-e2e9-479c-b7c4-fd97397397da.md', 'docs/SDK.md'],
  bookPath = './book.pdf';

markdownpdf()
  .concat.from(mdDocs)
  .to(bookPath, function() {
    console.log('Created', bookPath);
  });
