class DigestGem::ApplicationController < ApplicationController
  layout "digest_gem/application"

  def current
    current = eval(::AP::DigestGem::DigestG::Config.instance.latest_version.upcase)
    current
  end
  def full_digest
    current::Book.first
  end
  def supplemental_digest
    current::Book.first(:name =>  "Supplemental and Obsolescense Digest 176" )
  end

  def sd_related_content
    current::RelatedContent.all(:parent_id => current::Book.first(:name =>  "Supplemental and Obsolescense Digest 176" ).id).reverse
  end

  def fd_related_content
    current::RelatedContent.all(:parent_id => current::Book.first.id).reverse
  end

  def carousel
    current::HomeCarouselImage.all
  end

  helper_method :carousel
  helper_method :fd_related_content
  helper_method :current
  helper_method :full_digest
  helper_method :supplemental_digest
  helper_method :sd_related_content
end