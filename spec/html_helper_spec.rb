require 'spec_helper'

describe HtmlHelper do
  describe 'index_button' do
    let!(:expected_index_button_true) {
      "<li><a class=\" small button\" href=\"index.html\">Index</a></li>"
    }
    it { expect(HtmlHelper.index_button).to eq expected_index_button_true }

    let!(:expected_index_button_false) {
      "<li><a class=\"disabled small button\" href=\"index.html\">Index</a></li>"
    }
    it { expect(HtmlHelper.index_button(false)).to eq expected_index_button_false }
  end

  describe 'wrap_in_button_group' do
    let!(:html) { "some_html" }

    it { expect{HtmlHelper.wrap_in_button_group}.to raise_error ArgumentError }
    it { expect(HtmlHelper.wrap_in_button_group(html)).to eq "<ul class=\"button-group\">some_html</ul>" }
  end

  describe 'single_button_link' do
    it { expect{HtmlHelper.single_button_link}.to raise_error ArgumentError }

    let!(:text_here) { "here" }
    let!(:expected_here) { "<li><a class=\" small button\" href=\"here.html\">here</a></li>" }
    it { expect(HtmlHelper.single_button_link(text_here)).to eq expected_here }

    let!(:text_here_there) { "here there" }
    let!(:expected_here_there) { "<li><a class=\" small button\" href=\"here_there.html\">here there</a></li>" }
    it { expect(HtmlHelper.single_button_link(text_here_there)).to eq expected_here_there }

    let!(:expected_extra_class) { "<li><a class=\"some_class small button\" href=\"here.html\">here</a></li>" }
    it { expect(HtmlHelper.single_button_link(text_here, "some_class")).to eq expected_extra_class }
  end

  describe 'single_img' do
    it { expect{HtmlHelper.single_img}.to raise_error ArgumentError }

    let!(:url) { "http://somewhere/some_img.jpg" }
    let!(:expected_image) { "<li><img class=\"th\" src=\"http://somewhere/some_img.jpg\"></img></li>" }
    it { expect(HtmlHelper.single_img(url)).to eq expected_image }
  end

  describe 'wrap_in_block_ul' do
    let!(:html) { "some_html" }

    it { expect{HtmlHelper.wrap_in_block_ul}.to raise_error ArgumentError }
    it { expect(HtmlHelper.wrap_in_block_ul(html)).to eq "<ul class=\"small-block-grid-2 large-block-grid-5\">some_html</ul>" }
  end

  describe 'format_url' do
    let!(:normal_text) { "normal_text" }
    let!(:with_space) { "with space" }
    let!(:cap_with_space) { "CAP space" }

    it { expect{HtmlHelper.format_url}.to raise_error ArgumentError }
    it { expect(HtmlHelper.format_url(normal_text)).to eq "normal_text.html" }
    it { expect(HtmlHelper.format_url(with_space)).to eq "with_space.html" }
    it { expect(HtmlHelper.format_url(cap_with_space)).to eq "cap_space.html" }
  end
end
