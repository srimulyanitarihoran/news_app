String getCategoryImage(String category) {
  switch (category.toLowerCase()) {
    case 'business':
      return 'https://images.unsplash.com/photo-1507679799987-c73779587ccf?auto=format&fit=crop&w=800&q=60';
    case 'entertainment':
      return 'https://images.unsplash.com/photo-1497032628192-86f99bcd76bc?auto=format&fit=crop&w=800&q=60';
    case 'sports':
      return 'https://images.unsplash.com/photo-1508804185872-d7badad00f7d?auto=format&fit=crop&w=800&q=60';
    case 'technology':
      return 'https://images.unsplash.com/photo-1518770660439-4636190af475?auto=format&fit=crop&w=800&q=60';
    case 'health':
      return 'https://images.unsplash.com/photo-1584467735871-bc179c8df2c2?auto=format&fit=crop&w=800&q=60';
    case 'science':
      return 'https://images.unsplash.com/photo-1581091012184-5c1af19c44b0?auto=format&fit=crop&w=800&q=60';
    default:
      return 'https://images.unsplash.com/photo-1515378791036-0648a3ef77b2?auto=format&fit=crop&w=800&q=60';
  }
}
