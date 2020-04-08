{% macro render(display_toc) %}
  <div class="toggle sidebar-toggle">
    <span class="toggle-line toggle-line-first"></span>
    <span class="toggle-line toggle-line-middle"></span>
    <span class="toggle-line toggle-line-last"></span>
  </div>



  <aside class="sidebar">
    <div class="sidebar-inner">
    
      {%- set display_toc = page.toc.enable and display_toc %}
      {%- if display_toc %}
        {%- set toc = toc(page.content, { class: "nav", list_number: page.toc.number, max_depth: page.toc.max_depth }) %}
        {%- set display_toc = toc.length > 1 and display_toc %}
      {%- endif %}

      <ul class="sidebar-nav motion-element">
        <li class="sidebar-nav-toc">
          {{ __('sidebar.toc') }}
        </li>
        <li class="sidebar-nav-overview">
          {{ __('sidebar.overview') }}
        </li>
      </ul>

      <!--noindex-->
      <div class="post-toc-wrap sidebar-panel">
        {%- if display_toc %}
          <div class="post-toc motion-element">{{ toc }}</div>
        {%- endif %}
      </div>
      <!--/noindex-->

      <div class="site-overview-wrap sidebar-panel">
        {{ partial('_partials/sidebar/site-overview.swig', {}, {cache: theme.cache.enable}) }}

        {{- next_inject('sidebar') }}
      </div>

      {%- if theme.back2top.enable and theme.back2top.sidebar %}
        <div class="back-to-top motion-element">
          <i class="fa fa-arrow-up"></i>
          <span>0%</span>
        </div>
      {%- endif %}
      

      <link rel="stylesheet" 
        href="https://cdn.jsdelivr.net/npm/aplayer/dist/APlayer.min.css">
      <script src="https://cdn.jsdelivr.net/npm/aplayer/dist/APlayer.min.js"></script>
      <script src="https://cdn.jsdelivr.net/npm/meting/dist/Meting.min.js"></script>
      <meting-js
        auto="https://music.163.com/#/playlist?id=4953239816"
        list-folded="false"
        order="list"
        fixed="false"
        lrc-type="0">
      </meting-js>


    </div>
  </aside>
  <div id="sidebar-dimmer"></div>
{% endmacro %}

