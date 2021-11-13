defmodule NITRO.Combo do
  require NITRO
  require Record

  def to_list(fld) when is_atom(fld), do: fld
  def to_list(fld), do: :unicode.characters_to_list(fld, :unicode)

  def new(_name, obj, module, options) do
    dom = :proplists.get_value(:dom, options)
    feed = :proplists.get_value(:feed, options)
    dropDown(obj, dom, module, feed)
  end

  def proto(NITRO.comboKey(value: "")), do: []
  def proto(NITRO.comboKey(delegate: []) = msg), do: NITRO.Combo.Search.keyUp(msg)
  def proto(NITRO.comboScroll(delegate: []) = msg), do: NITRO.Combo.Search.comboScroll(msg)
  def proto(NITRO.comboInsert(delegate: []) = msg), do: comboInsert(msg)

  def proto(NITRO.comboKey(delegate: module) = msg) do
    case has_function(module, :keyUp) do
      true -> module.keyUp(msg)
      false -> NITRO.Combo.Search.keyUp(msg)
    end
  end

  def proto(NITRO.comboScroll(delegate: module) = msg) do
    case has_function(module, :comboScroll) do
      true -> module.comboScroll(msg)
      false -> NITRO.Combo.Search.comboScroll(msg)
    end
  end

  def proto(NITRO.comboSelect(delegate: module) = msg) do
    case has_function(module, :select) do
      true -> module.select(msg)
      false -> :skip
    end
  end

  def proto(NITRO.comboInsert(delegate: module) = msg) do
    case has_function(module, :comboInsert) do
      true -> module.comboInsert(msg)
      false -> comboInsert(msg)
    end
  end

  def comboInsert(NITRO.comboInsert(chunks: 0, dom: field, status: :finished)) do
    :nitro.wire("activeCombo = undefined; currentItem = undefined;")
    :nitro.hide(:nitro.atom([:comboContainer, :nitro.to_list(field)]))
    :nitro.wire("comboOpenFormById('#{:nitro.atom([:nitro.to_list(field), 'form'])}');")
  end

  def comboInsert(NITRO.comboInsert(dom: field, rows: rows, delegate: module, feed: feed)) do
    :lists.foreach(fn row ->
      :nitro.insert_bottom(
        :nitro.atom([:comboContainer, :nitro.to_list(field)]),
        :nitro.render(dropDown0(row, :nitro.to_list(field), module, feed))
      )
    end, rows)
  end

  def dropDownList0(filtered, field, module, feed) do
    if has_function(module, :dropDownList) do
      module.dropDownList(filtered, field, module, feed)
    else
      dropDownList(filtered, field, module, feed)
    end
  end

  def dropDownList(filtered, field, module, feed) do
    formId = :nitro.atom([field, "form"])

    if filtered == [] do
      :nitro.wire("activeCombo = undefined; currentItem = undefined;")
      :nitro.hide(:nitro.atom([:comboContainer, field]))
      :nitro.wire("comboOpenFormById('#{formId}');")
    else
      :nitro.display(:nitro.atom([:comboContainer, field]), :block)
      :nitro.wire("comboCloseFormById('#{formId}');")
    end

    Enum.each(filtered, fn obj ->
      form = dropDown0(obj, field, module, feed)

      :nitro.insert_top(
        :nitro.atom([:comboContainer, field]),
        :nitro.render(form)
      )
    end)
  end

  def dropDown0(obj, dom0, module, feed) do
    case has_function(module, :dropDown) do
      true ->
        module.dropDown(obj, dom0, feed)

      false ->
        dropDown(obj, dom0, module, feed)
    end
  end

  def view_value(obj, _, _) when obj in ["", [], :undefined], do: []

  def view_value(obj, module, feed) do
    case :erlang.function_exported(module, :view_value, 2) do
      true ->
        module.view_value(obj, feed)

      false ->
        if has_function(module, :view_value) do
          module.view_value(obj)
        else
          view_value(obj)
        end
    end
  end

  def view_value(obj) when obj in ["", [], :undefined], do: []
  def view_value(obj), do: :nitro.jse(:erlang.iolist_to_binary(apply(:kvs,:field,[obj, hd(index([]))])))

  def dropDown(obj, dom0, module, feed) do
    view_value = view_value(obj, module, feed)
    dom = :nitro.to_list(dom0)
    id = :nitro.jse(:erlang.iolist_to_binary(:nitro.atom([dom, :erlang.element(2, obj)])))
    item = :nitro.to_list(item(obj, module))
    source = :erlang.iolist_to_binary(feed)
    click = :nitro.jse("comboSelect('#{dom}', '#{view_value}', '#{source}', '#{module}', '#{id}')")
    move = :nitro.jse("comboLookupMouseMove('#{dom}')")

    NITRO.panel(
      id: id,
      class: ['dropdown-item'],
      bind: :base64.encode(:erlang.term_to_binary(obj)),
      onclick: click,
      onmousemove: move,
      body: [
        NITRO.p(body: item)
      ]
    )
  end

  def index([]), do: [:name, :id]

  def index(module) do
    case has_function(module, :index) do
      true -> module.index()
      false -> index([])
    end
  end

  def item(obj, []), do: view_value(obj)

  def item(obj, module) do
    case has_function(module, :item) do
      true -> module.item(obj)
      false -> item(obj, [])
    end
  end

  def update_comboVec(_parent, dom, feed, module, default, elem) do
    vector  = view_value(default, module, feed)
    clear   = "createSortable('##{dom}_list');"
    append  = :lists.map(fn emp -> bind = emp |> :erlang.term_to_binary |> :base64.encode
                 "appendItemFromBind('#{dom}_list','#{module.cn(emp)}','#{bind}');" end, vector)
              |> :erlang.iolist_to_binary
    render  = :nitro.render elem
    command = "elem = qi('#{dom}'); elem.outerHTML = '#{render}';"
    :nitro.wire(command <> append <> clear) # reverse
  end

  def update_combo(id, feed, module), do: :nitro.update(:nitro.atom([:lookup, id]), NITRO.comboLookup(id: id, feed: feed, delegate: module))

  def update_combo_value(dom, value, feed, module) do
    view_value = view_value(value, module, feed)
    update_combo_value(dom, value, feed, module, view_value)
  end

  def update_combo_value(dom, value, feed, module, view_value) do
    bind = :base64.encode(:erlang.term_to_binary(value))
    update_combo(dom, feed, module)
    command = "elem = qi('#{dom}'); elem.setAttribute('data-bind', '#{bind}'); elem.value = '#{view_value}';"
    :nitro.wire(command)
  end

  def has_function(m, f) do
    functions = apply(m, :module_info, [:exports])
    isF = Keyword.get(functions, f, -1)
    isF != -1
  end
end
