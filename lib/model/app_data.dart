import 'package:tourist_application/model/category.dart';
import 'package:tourist_application/model/trip.dart';

const Categories_data = const [
  Category(
    id: 'c1',
    title: 'Mountains',
    imageUrl:
        'https://images.unsplash.com/photo-1575728252059-db43d03fc2de?ixid=MXwxMjA3fDB8MHxzZWFyY2h8NTh8fG1vdW5hdGluc3xlbnwwfHwwfA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=400&q=',
  ),
  Category(
    id: 'c2',
    title: 'Lakes',
    imageUrl:
        'https://images.unsplash.com/photo-1501785888041-af3ef285b470?ixid=MXwxMjA3fDB8MHxzZWFyY2h8NHx8bGFrZXxlbnwwfHwwfA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=400&q=60',
  ),
  Category(
    id: 'c3',
    title: 'Beaches',
    imageUrl:
        'https://images.unsplash.com/photo-1493558103817-58b2924bce98?ixid=MXwxMjA3fDB8MHxzZWFyY2h8MTAxfHxiZWFjaHxlbnwwfHwwfA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=400&q=60',
  ),
  Category(
    id: 'c4',
    title: 'Deserts',
    imageUrl:
        'https://images.unsplash.com/photo-1473580044384-7ba9967e16a0?ixid=MXwxMjA3fDB8MHxzZWFyY2h8MXx8ZGVzZXJ0fGVufDB8fDB8&ixlib=rb-1.2.1&auto=format&fit=crop&w=400&q=60',
  ),
  Category(
    id: 'c5',
    title: 'Historical Cities',
    imageUrl:
        'https://images.unsplash.com/photo-1467269204594-9661b134dd2b?ixid=MXwxMjA3fDB8MHxzZWFyY2h8NjR8fHRyYXZlbHxlbnwwfHwwfA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=400&q=60',
  ),
  Category(
    id: 'c6',
    title: 'Others',
    imageUrl:
        'https://images.unsplash.com/photo-1605540436563-5bca919ae766?ixid=MXwxMjA3fDB8MHxzZWFyY2h8MXx8c2tpaW5nfGVufDB8fDB8&ixlib=rb-1.2.1&auto=format&fit=crop&w=400&q=60',
  ),
];

const Trips_data = const [
  Trip(
    id: 'm1',
    categories: [
      'c1',
    ],
    title: 'Alps Mountains',
    tripType: TripType.Exploration,
    season: Season.Winter,
    imageUrl:
        'https://images.unsplash.com/photo-1611523658822-385aa008324c?ixid=MXwxMjA3fDB8MHxzZWFyY2h8N3x8bW91bmF0aW5zfGVufDB8fDB8&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60',
    duration: 20,
    activities: [
      'Visiting archaeological sites',
      'Walking tour',
      'Shopping at commercial centers',
      'Having lunch',
      'Enjoying the beautiful views'
    ],
    program: [
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
      'Skiing, walking tour, and enjoying the views.',
      'Lorem ipsum dolor sit amet.',
      'Visit the ancient ruins and enjoy local food.',
    ],
    isInSummer: false,
    isForFamilies: true,
    isInWinter: true,
  ),
  Trip(
    id: 'm2',
    categories: [
      'c1',
    ],
    title: 'Southern Mountains',
    tripType: TripType.Exploration,
    season: Season.Summer,
    imageUrl:
        'https://images.unsplash.com/photo-1612456225451-bb8d10d0131d?ixid=MXwxMjA3fDB8MHxzZWFyY2h8MjZ8fG1vdW5hdGluc3xlbnwwfHwwfA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60',
    duration: 10,
    activities: [
      'Visiting archaeological sites',
      'Walking tour',
      'Shopping at commercial centers',
      'Having lunch',
      'Enjoying the beautiful views'
    ],
    program: [
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
      'Walking tour, and enjoying the views.',
      'Visit the ancient ruins and enjoy local food.',
    ],
    isInSummer: true,
    isInWinter: false,
    isForFamilies: false,
  ),
  Trip(
    id: 'm3',
    categories: [
      'c1',
    ],
    title: 'High Mountains',
    tripType: TripType.Recovery,
    season: Season.Winter,
    imageUrl:
        'https://images.unsplash.com/photo-1592221912790-2b4df8882ea9?ixid=MXwxMjA3fDB8MHxzZWFyY2h8Mzd8fG1vdW5hdGluc3xlbnwwfHwwfA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60',
    duration: 45,
    activities: [
      'Visiting archaeological sites',
      'Walking tour',
      'Shopping at commercial centers',
      'Having lunch',
      'Enjoying the beautiful views'
    ],
    program: [
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
      'Skiing, walking tour, and enjoying the views.',
      'Lorem ipsum dolor sit amet.',
      'Visit the ancient ruins and enjoy local food.',
    ],
    isInSummer: false,
    isInWinter: true,
    isForFamilies: false,
  ),
  Trip(
    id: 'm4',
    categories: [
      'c2',
    ],
    title: 'Great Lake',
    tripType: TripType.Activities,
    season: Season.Summer,
    imageUrl:
        'https://images.unsplash.com/photo-1476514525535-07fb3b4ae5f1?ixid=MXwxMjA3fDB8MHxzZWFyY2h8OXx8bGFrZXxlbnwwfHwwfA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60',
    duration: 60,
    activities: [
      'Visiting archaeological sites',
      'Walking tour',
      'Shopping at commercial centers',
      'Having lunch',
      'Enjoying the beautiful views'
    ],
    program: [
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
      'Walking tour, and enjoying the views.',
      'Visit the ancient ruins and enjoy local food.',
    ],
    isInSummer: true,
    isInWinter: false,
    isForFamilies: true,
  ),
  Trip(
    id: 'm5',
    categories: [
      'c2',
    ],
    title: 'Small Lakes',
    tripType: TripType.Activities,
    season: Season.SummerAndWinter,
    imageUrl:
        'https://images.unsplash.com/photo-1580100586938-02822d99c4a8?ixid=MXwxMjA3fDB8MHxzZWFyY2h8MjF8fGxha2V8ZW58MHx8MHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=600&q=60',
    duration: 15,
    activities: [
      'Visiting archaeological sites',
      'Walking tour',
      'Shopping at commercial centers',
      'Having lunch',
      'Enjoying the beautiful views'
    ],
    program: [
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
      'Skiing, walking tour, and enjoying the views.',
      'Lorem ipsum dolor sit amet.',
      'Visit the ancient ruins and enjoy local food.',
    ],
    isInSummer: true,
    isForFamilies: false,
    isInWinter: true,
  ),
  Trip(
    id: 'm6',
    categories: [
      'c2',
    ],
    title: 'Emerald Lake',
    tripType: TripType.Exploration,
    season: Season.Summer,
    imageUrl:
        'https://images.unsplash.com/photo-1501785888041-af3ef285b470?ixid=MXwxMjA3fDB8MHxzZWFyY2h8NHx8bGFrZXxlbnwwfHwwfA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60',
    duration: 20,
    activities: [
      'Visiting archaeological sites',
      'Walking tour',
      'Shopping at commercial centers',
      'Having lunch',
      'Enjoying the beautiful views'
    ],
    program: [
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
      'Skiing, walking tour, and enjoying the views.',
      'Lorem ipsum dolor sit amet.',
      'Visit the ancient ruins and enjoy local food.',
    ],
    isInSummer: true,
    isForFamilies: true,
    isInWinter: false,
  ),
];
