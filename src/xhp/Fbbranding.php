<?hh // strict

class :fbbranding extends :x:element {
  category %flow;
  attribute string brandingText;

  protected string $tagName = 'fbbranding';

  protected function render(): XHPRoot {
    return
      <a class="branding-el" href="https://www.linkedin.com/in/jtesse">
        <span>Workshop by:&nbsp;</span>
        <svg class="icon icon--social-linkedin">
          <use href="#icon--social-linkedin" />
        </svg>
        <span class="has-icon">Joran</span>
      </a>;
  }
}
