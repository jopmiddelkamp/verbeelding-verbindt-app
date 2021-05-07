import '../entities/page_content/intro_page_content.dart';

abstract class PageContentRepository {
  Stream<IntroPageContentEntity> getIntroPageContent();
}
