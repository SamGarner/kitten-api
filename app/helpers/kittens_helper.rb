module KittensHelper
  def delete_kitten_link(cat)
    link_to 'Delete', cat, method: :delete
  end
end
