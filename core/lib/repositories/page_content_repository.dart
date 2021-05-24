import '../entities/page_content/intro_page_content.dart';
import '../entities/page_content/route_completed_page_content.dart';
import 'repository_base.dart';

abstract class PageContentRepository extends RepositoryBase {
  Stream<IntroPageContentEntity?> getIntroPageContent();
  Stream<RouteCompletedPageContentEntity?> getRouteCompletedPageContent();
}
