#include "Measure.h"

namespace tom
{
  class MeasureDefault : public Measure
  {
  public:
    MeasureDefault(const WorldTime initialTime, const std::string uri) : Measure(initialTime, uri)
    {
      return;
    }

    void refresh(const Trajectory* x)
    {
      return;
    }
    
    bool hasData(void)
    {
      return (false);
    }
    
    unsigned first(void)
    {
      throw("The default sensor has no data.");
      return (0);
    }
    
    unsigned last(void)
    {
      throw("The default sensor has no data.");
      return (0);
    }
    
    WorldTime getTime(unsigned n)
    {
      throw("The default sensor has no data.");
      return (0);
    }

    void findEdges(const uint32_t naMin, const uint32_t naMax, const uint32_t nbMin, 
      const uint32_t nbMax, std::vector<GraphEdge>& edgeList)
    {
      edgeList.resize(0);
      return;
    }

    double computeEdgeCost(const Trajectory* x, const GraphEdge graphEdge)
    {
      return (0.0);
    }

  private:
    static std::string componentDescription(void)
    {
      return ("This default measure constructs no graph edges.");
    }

    static Measure* componentFactory(const WorldTime initialTime, const std::string uri)
    {
      return (new MeasureDefault(initialTime, uri));
    }

  protected:
    static void initialize(std::string name)
    {
      connect(name, componentDescription, componentFactory);
    }
    friend class MeasureDefaultInitializer;
  };

  class MeasureDefaultInitializer
  {
  public:
    MeasureDefaultInitializer(void)
    {
      MeasureDefault::initialize("tom");
    }
  } _MeasureDefaultInitializer;
}