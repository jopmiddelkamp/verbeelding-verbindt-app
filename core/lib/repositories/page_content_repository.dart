import '../entities/page_content/intro_page_content.dart';
import '../entities/page_content/route_completed_page_content.dart';

abstract class PageContentRepository {
  Stream<IntroPageContentEntity?> getIntroPageContent();
  Stream<RouteCompletedPageContentEntity?> getRouteCompletedPageContent();
}
